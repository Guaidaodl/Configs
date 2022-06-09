source ~/.vim/config/utils.vim

function! plugin#main()
  call plug#begin('~/.vim/plug')
  
  " enhanced
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'tpope/vim-surround'
  Plug 'easymotion/vim-easymotion'

  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
    " 支持 neovim 内置的 lsp
    Plug 'deoplete-plugins/deoplete-lsp'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  endif

  
  Plug 'itchyny/lightline.vim'
  Plug 'vim-scripts/vim-auto-save'
 
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

  Plug 'liuchengxu/vim-which-key'
  " Git 
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  Plug 'nathanaelkane/vim-indent-guides'
 
  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
  " 预览
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 
  "Code snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  
  " Themes
  Plug 'sickill/vim-monokai'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'dracula/vim'
  Plug 'vim-scripts/Solarized'
  
  """"""""""""""""""""""""""""" IDE 相关的插件
  Plug 'neovim/nvim-lspconfig'
  " 彩虹括号
  Plug 'luochen1990/rainbow'
  " 调试
  let g:vimspector_enable_mappings = 'HUMAN'
  Plug 'puremourning/vimspector'

  " 异步运行命令
  Plug 'skywind3000/asyncrun.vim'
  Plug 'skywind3000/asynctasks.vim'

  """ 语法高亮
  Plug 'udalov/kotlin-vim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'wlangstroth/vim-racket'
  Plug 'pboettch/vim-cmake-syntax'

  call plug#end()
  
  """""""""""""""""""""""""""插件相关设置
  call plugin#config_lightline()
  call plugin#config_leaderf()
  call plugin#config_which_key()
  call plugin#config_asyncrun()
  call plugin#config_ultisnips()
  call plugin#config_rainbow()
  if has('nvim')
    call plugin#config_deoplete()
    call plugin#config_defx()
    call plugin#config_lsp()
  endif
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
  let g:airline_theme='bubblegum'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_section_b = "%{airline#util#wrap(airline#extensions#branch#get_head(),0)}" 
  """ git
  let g:gitgutter_enable = 1
endfunction

function! plugin#config_lightline()
  let g:lightline = {}
  let g:lightline.active = {
      \ 'left': [ [ 'winnr', 'mode', 'paste' ],
      \           [ 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }
  let g:lightline.inactive = {
      \ 'left': [ [ 'winnr', 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ] }
  let g:lightline.tabline = {
      \ 'left': [ [ 'tabs' ] ],
      \ 'right': [ [ 'close' ] ] }
endfunction

""" 配置 leaderf
function! plugin#config_leaderf()
  " 配置图标
  let g:Lf_ShowDevIcons = 0
  let g:Lf_UseVersionControlTool = 0
  let g:Lf_DefaultExternalTool = "rg"
endfunction

""" 配置 deoplete
function! plugin#config_deoplete()
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option({
  \ 'smart_case': v:true,
  \})
endfunction

""" 配置 whichkey
function! plugin#config_which_key()
  let g:mapleader = "\<Space>"
  let g:which_key_use_floating_win = 1
  nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
endfunction
"""" 配置 Asyncrun
function! plugin#config_asyncrun()
  " 自动打开 quickfix window ，高度为 6
  let g:asyncrun_open = 10

  " 设置 F10 打开/关闭 Quickfix 窗口
  nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
endfunction

""" 配置 Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
function! plugin#config_ultisnips()
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
endfunction


""" 配置 rainbow
function! plugin#config_rainbow()
  let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
endfunction

""" 配置 defx
function! plugin#config_defx()
    call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
    autocmd FileType defx call s:defx_my_settings()
endfunction

function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

function! plugin#config_lsp() 
lua << EOF
local lspconfig = require('lspconfig')
local on_attach = function(client, bufnr)
end
lspconfig.rls.setup{}

lspconfig.clangd.setup{}
EOF
endfunction
