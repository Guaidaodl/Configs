set nocompatible
set hls "检索时高亮
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, requred
Plugin 'gmarik/Vundle.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-scripts/vim-auto-save'
" 主题
Plugin 'sickill/vim-monokai'
call vundle#end()
filetype on

"""""""""""""""""""""""""""插件相关设置
"""vim-auto-save
let g:auto_save = 1 "enable the vim-auto-save
let g:auto_save_in_insert_mode = 0 "do not save while in insert mode
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_slient = 1 "do not display the auto-save notification
""""""""""""""""""""""""插件设置结束
"显示行号
syn on
set number
set ai "自动缩进
set bs=2
set showmatch
set laststatus=2 "总是显示状态栏
set cursorline
set nowrap

syntax enable
colorscheme monokai

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h16
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif    
endif

"以下为配置tab和缩进
set expandtab
set shiftwidth=4
set tabstop=4

set autoread "自动读取已经修改的文件

set ignorecase "检索时忽略大小写
set incsearch
set hls "检索时高亮
set foldmethod=syntax "代码折叠
set foldlevelstart=99
"set helplang=cn

"""""""""""""""""""""""""""快捷键""""""""""""""""""""""""""
"normal 和visual模式快捷键
let mapleader = ' '
"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
nnoremap <C-l> gt
nnoremap <C-h> gT
nnoremap <F10> :set transparency=0<CR>
nnoremap <F11> :set transparency=30<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"调整缩进的快捷键
nnorema <C-[> <<
nnoremap <tab> >>
nnoremap <C-]> >>
"移动光标的快捷键
nnoremap <C-e> $
nnoremap <C-a> ^
nnoremap <C-k> d$
nnoremap <C-p> ddkP
nnoremap <C-n> ddp

nnoremap <C-o> <Esc>
"laeder相关的配置
nnoremap <leader>x :close <CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:echo "(>^.^<)"<CR>
"insert模式下的快捷键
inoremap <C-k> <Esc>d$a
inoremap jk <Esc>
inoremap <esc> <nop>

"""跟文件类型有关的快捷键
autocmd FileType html noremap <F5> :!open %<CR><CR>
autocmd FileType vim  noremap <F5> :source %<CR>

"设置初始化的窗口大小
set columns=120
set lines=40




