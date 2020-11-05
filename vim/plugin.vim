source ~/.vim/config/utils.vim

function! plugin#main()
  call plug#begin('~/.vim/plug')
  
  " Add or remove your plugins here:
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
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
 
  "Code snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  
  " Themes
  Plug 'sickill/vim-monokai'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'dracula/vim'
  Plug 'vim-scripts/Solarized'
  
  """"""""""""""""""""""""""""" IDE 相关的插件
  " 彩虹括号
  Plug 'luochen1990/rainbow'

  " 异步运行命令
  Plug 'skywind3000/asyncrun.vim'

  """ 语法高亮
  Plug 'udalov/kotlin-vim'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'wlangstroth/vim-racket'
  call plug#end()
  
  """""""""""""""""""""""""""插件相关设置
  call plugin#config_which_key()
  call plugin#config_asyncrun()
  call plugin#config_ultisnips()
  call plugin#config_rainbow()
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
