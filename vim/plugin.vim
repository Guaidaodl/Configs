source ~/.vim/config/utils.vim

function! plugin#main()
  call plug#begin('~/.vim/plug')
  
  " Add or remove your plugins here:
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/vim-auto-save'
 
  Plug '/usr/local/opt/fzf'
  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'

  Plug 'liuchengxu/vim-which-key'
  " Git 
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  Plug 'nathanaelkane/vim-indent-guides'
 
  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
 
  "Code snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  
  " Themes
  Plug 'sickill/vim-monokai'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'dracula/vim'
  Plug 'vim-scripts/Solarized'
  
  """"""""""""""""""""""""""""" IDE 相关的插件
  " 自动补全
"  Plug 'autozimu/LanguageClient-neovim', {
"        \ 'branch': 'next',
"        \ 'do': 'bash install.sh',
"        \ }
"  call plugin#config_client()
  Plug 'w0rp/ale'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  
  " 符号跳转
  Plug 'ludovicchabant/vim-gutentags'

  " 异步运行命令
  Plug 'skywind3000/asyncrun.vim'

  """ 语法高亮
  Plug 'udalov/kotlin-vim'
  Plug 'dart-lang/dart-vim-plugin'
  call plug#end()
  
  """""""""""""""""""""""""""插件相关设置
  call plugin#config_fzf()
  call plugin#config_which_key()
  call plugin#config_gutentags()
  call plugin#config_asyncrun()
  call plugin#config_ultisnips()
  call plugin#config_deoplete()
  call plugin#config_ale()
  call plugin#config_deoplete()
  """vim-auto-save
  let g:auto_save = 1 "enable the vim-auto-save
  let g:auto_save_in_insert_mode = 0 "do not save while in insert mode
  let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
  let g:auto_save_slient = 1 "do not display the auto-save notification

  """vim-indent-guides
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_enable_on_vim_startup = 1
  
  """ airline 
  let g:airline_theme='papercolor'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_section_b = "%{airline#util#wrap(airline#extensions#branch#get_head(),0)}" 
  """ git
  let g:gitgutter_enable = 1

endfunction

"""" 配置 whichkey
function! plugin#config_which_key()
  set timeoutlen=500
  let g:mapleader = "\<Space>"
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
endfunction
"""" 配置 Asyncrun
function! plugin#config_asyncrun()
  " 自动打开 quickfix window ，高度为 6
  let g:asyncrun_open = 10

  " 设置 F10 打开/关闭 Quickfix 窗口
  nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
endfunction

""" 配置 fzf 相关的快捷键
function! plugin#config_fzf()
  " 快捷键
  nnoremap <leader>fa :Tags<CR>
  nnoremap <leader>fb :Buffers<CR>
  nnoremap <leader>ff :Files<CR>
  nnoremap <leader>fh :History:<CR>
  nnoremap <leader>ft :BTags<CR>
  nnoremap <A-x> :Commands<CR>
endfunction

""" 配置gutentags
"
" 想要正常使用 gutentags 需要使用 gtags 和 universal-ctags 
" 可以使用 brew 安装
function! plugin#config_gutentags()
  " 项目根目录的标志
  let g:gutentags_project_root = ['.git', 'Cargo.toml']
  " 所生成的数据文件的名称
  let g:gutentags_ctags_tagfile = '.tags'

  let g:gutentags_modules = []
  if executable('ctags')
    let g:gutentags_modules += ['ctags']
  endif
  if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
  endif

  " 忽略 build 文件夹里的
  let g:gutentags_ctags_exclude = ['build', 'target']
  " 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  let s:vim_tags = expand('~/.cache/tags')
  let g:gutentags_cache_dir = s:vim_tags

  " 兼容 universal ctags
  let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
  " 检测 ~/.cache/tags 不存在就新建
  if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
  endif
endfunction

function! plugin#config_ale() 
  let g:ale_linters = {
    \ 'rust': ['rls'],  
    \}
  let g:ale_rust_rls_toolchain = 'stable'

  "开启自动补全
  let g:ale_completion_enabled = 1

  "ale 相关的快捷键
  nnoremap <silent> <C-q> :ALEHover<CR>
  nnoremap <silent> <C-j> :ALEGoToDefinition<CR>
  nnoremap <silent> <C-g> :ALEFindReferences<CR>

  " Windows 下显示 emoji 一直有问题. 所以就用默认的
  if (utils#isMac())
    let g:ale_sign_error = '❌'
    let g:ale_sign_warning = "❗️"
    let g:ale_sign_info = "❕"
  endif
  let g:ale_set_highlights = 0
endfunction

""" 配置Deoplete
function! plugin#config_deoplete()
  let g:deoplete#enable_at_startup = 1
  if (has('win32'))
    let g:python3_host_prog = "python"
  endif
endfunction  

""" 配置 LanguageClient
function! plugin#config_client()

  """ LanguageClient
  set hidden

  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

  let g:LanguageClient_serverCommands = {
        \   'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ }

  let g:LanguageClient_hoverPreview = "Always"

  let g:LanguageClient_diagnosticsDisplay = {
        \   1: {
        \     "name": "Error",
        \     "texthl": "ALEError",
        \     "signText": "❌",
        \     "signTexthl": "ALEErrorSign",
        \   },
        \   2: {
        \     "name": "Warning",
        \     "texthl": "ALEWarning",
        \     "signText": "❗️",
        \     "signTexthl": "ALEWarningSign",
        \   },
        \   3: 
        \       "name": "Information",
        \       "texthl": "ALEInfo",
        \       "signText": "❓",
        \       "signTexthl": "ALEInfoSign",
        \   },
        \   4: {
        \       "name": "Hint",
        \       "texthl": "ALEInfo",
        \       "signText": "🔍",
        \       "signTexthl": "ALEInfoSign",
        \   },
        \ }
endfunction 

""" 配置 Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
function! plugin#config_ultisnips()
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endfunction

