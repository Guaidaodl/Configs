local opt = vim.opt

-- UI
opt.number = true
opt.cursorline = true
opt.wrap = false
opt.background = "dark"
opt.laststatus = 2
opt.showmatch = true
opt.pumheight = 10

-- Indentation
opt.expandtab = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4
opt.autoindent = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true

-- Whitespace display
opt.list = true
opt.listchars = { tab = ">-", space = "·" }

-- Folding
opt.foldmethod = "syntax"
opt.foldlevelstart = 99

-- Misc
opt.mouse = "a"
opt.autoread = true
opt.backspace = "indent,eol,start"
opt.fileencodings = "utf-8,gb18030,gbk,gb2312,cp936"

-- Neovide
if vim.g.neovide then
    opt.guifont = "FiraCode Nerd Font:h14"
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
    vim.g.neovide_position_animation_length = 0
    vim.g.neovide_cursor_animation_length = 0.00
    vim.g.neovide_cursor_trail_size = 0
    vim.g.neovide_cursor_animate_in_insert_mode = true
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_scroll_animation_far_lines = 0
    vim.g.neovide_scroll_animation_length = 0.00
end
