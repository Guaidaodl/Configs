# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 仓库用途

个人配置文件，通过符号链接管理 Neovim、Git、IdeaVim、Zsh、Spacemacs 的配置。

## 安装配置

```bash
python3 install.py <config>     # nvim | git | ideavim | zsh | spacemacs | all
python3 install.py -f <config>  # 覆盖已有符号链接
```

每个安装器将 `~/.config/nvim`（或 `~/.gitconfig` 等）符号链接到本仓库对应目录。

## Neovim 架构

入口：`nvim/init.lua` — 设置 leader 键，加载 `config.*`，然后引导 **lazy.nvim** 并导入所有插件模块。

配置分两层：

- `nvim/lua/config/` — 编辑器级设置（options、keymaps、autocmds），不依赖任何插件。
- `nvim/lua/plugins/` — 每个文件对应一组插件，返回 lazy.nvim spec 表。

插件加载顺序：`ui`, `whichkey`, `editor`, `telescope`, `tree`, `terminal`, `git`, `completion`, `lsp`, `treesitter`, `tasks`, `markdown`。

### 快捷键约定

- `<leader>` 为空格键。
- 大部分 leader 绑定在 `whichkey.lua` 中注册，前缀分组：`g`=git、`j`=跳转/telescope、`l`=lsp、`f`=文件、`b`=buffer、`w`=窗口、`t`=标签页、`q`=quickfix、`m`=宏。
- LSP 绑定（`<leader>l*`）在 `lsp.lua` 的 `LspAttach` 事件中动态注册。
- 不适合放入 whichkey 的插件专属绑定，通过 lazy spec 的 `keys = {}` 字段声明。
- Neovide 专属 Mac 快捷键（`<D-*>`）用 `vim.g.neovide` 守卫。
- `<A-hjkl>` 在普通模式和终端模式下均可切换窗口。
- `<A-f>` 切换浮动终端（toggleterm）。

### 添加新插件

在 `nvim/lua/plugins/` 下新建或编辑对应文件，返回 lazy.nvim spec。若有 leader 绑定，在 `whichkey.lua` 注册分组；用 `keys = {}` 字段触发懒加载。
