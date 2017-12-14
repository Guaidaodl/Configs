set nocompatible
set hls "检索时高亮

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" required:
if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('rizzatti/dash.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('vim-scripts/vim-auto-save')

  " Git 
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')

  call dein#add('benekastah/neomake')
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('nathanaelkane/vim-indent-guides')
  " Markdown
  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('dhruvasagar/vim-table-mode')
  " c/c++ 加强
  call dein#add('Valloric/YouCompleteMe')
  call dein#add('rdnetto/YCM-Generator')

  call dein#add('majutsushi/tagbar')

  call dein#add('rust-lang/rust.vim')
  call dein#add('keith/swift.vim')

  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('Shougo/neco-vim')
  
  " Themes
  call dein#add('sickill/vim-monokai')
  call dein#add('skielbasa/vim-material-monokai')
  call dein#add('dracula/vim')
  call dein#add('vim-scripts/Solarized')
  
  " required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

filetype on

"""""""""""""""""""""""""""插件相关设置
"""deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10
let g:deoplete#sources = {}

"""vim-auto-save
let g:auto_save = 1 "enable the vim-auto-save
let g:auto_save_in_insert_mode = 0 "do not save while in insert mode
let g:auto_save_no_updatetime = 1  " do not change the 'updatetime' option
let g:auto_save_slient = 1 "do not display the auto-save notification
"""ctrlp的配置
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['build.gradle', 'pom.xml']
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"""YCM 的配置
let g:ycm_error_symbol= '>>'
let g:ycm_warning_symbol=">*"
let g:ycm_confirm_extra_conf = 1   "自动加载config

"""vim-indent-guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

""" table mode
let g:table_mode_corner = "|"

""" YouCompleteMe
let g:enable_ycm_at_startup = 0

""" airline theme
let g:airline_theme='papercolor'

""" git
let g:gitgutter_enable = 1

""" cscope
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=1
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif
  set csverb
endif
""""""""""""""""""""""""插件设置结束

syntax enable
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936
"隐藏菜单和工具条
set guioptions-=T
"显示行号
syn on
set number
set ai "自动缩进
set bs=2
set showmatch
set laststatus=2 "总是显示状态栏
set cursorline
set nowrap

colorscheme dracula

"语法缩进
"set foldmehod=indent
set foldmethod=syntax

if has("gui_running")
  if has("gui_macvim")
    set guifont=Menlo\ Regular:h16
  elseif has("gui_win32")
    set guifont=Consolas:h16:cANSI
  else
    " linux
    set guifont=Inconsolata\ 16
  endif    
endif

"以下为配置tab和缩进
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set list
set lcs=tab:>-,
set autoread "自动读取已经修改的文件

set ignorecase "检索时忽略大小写
set incsearch
set hls "检索时高亮
set foldmethod=syntax "代码折叠
set foldlevelstart=99
"set helplang=cn

"""""""""""""""""""""""""""快捷键""""""""""""""""""""""""""
let mapleader = ' '

"""跟文件类型有关的快捷键
autocmd FileType html noremap <F5> :!open %<CR><CR>
autocmd FileType vim  noremap <F5> :source %<CR>
autocmd FileType ruby setl sw=2 sts=2

"insert模式下的快捷键
inoremap <C-k> <Esc>d$a
inoremap jk <Esc>

"visual mode
vnoremap jk <esc>
vnoremap <leader>y "+y
"conf for tabs, 为标签页进行的配置，通过ctrl h/l切换标签等
nnoremap <F10> :set transparency=0<CR>
nnoremap <F11> :set transparency=30<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"移动光标的快捷键
nnoremap <C-k> d$

" JumpList
nnoremap <leader>je :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" TagBar
nnoremap <F8> :TagbarToggle<CR>

" laeder相关的配置
nnoremap <leader><SPACE> :
nnoremap <leader>x :close<CR>

" File 相关的配置
nnoremap <leader>fs :w<CR>
nnoremap <leader>fo :e<SPACE>

"copy line to system clipboard
nnoremap <leader>y "+yy
nnoremap <leader>ev :tabe $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>:echo "(>^.^<)"<CR>

"Buffer 相关的快捷键
nnoremap <leader>b1 :buffer 1<CR>
nnoremap <leader>b2 :buffer 2<CR>
nnoremap <leader>b3 :buffer 3<CR>
nnoremap <leader>b4 :buffer 4<CR>
nnoremap <leader>b5 :buffer 5<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

"CtrlP 的快捷键
nnoremap <leader>pat :CtrlPBufTagAll<CR>
nnoremap <leader>pb  :CtrlPBuffer<CR>
nnoremap <leader>pf  :CtrlP<CR>
nnoremap <leader>pt  :CtrlPBufTag<CR>
nnoremap <leader>pr  :CtrlPMRUFiles<CR>

" Windows 相关的快捷键
nnoremap <leader>wc :close<CR>
nnoremap <leader>ws :split<CR>
nnoremap <leader>wt :NERDTreeToggle<CR>
nnoremap <leader>wv :vs<CR>
nnoremap <leader>ww <C-w><C-w>
nnoremap <leader>wo <C-w>o
nnoremap <leader>wl <C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>w= <C-w>=
nnoremap <leader>w+ 10<C-w>+
nnoremap <leader>w- 10<C-w>-
nnoremap <leader>w> 10<C-w>>
nnoremap <leader>w< 10<C-w><

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
if has('nvim')
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
endif 

" Cscpoe 相关的快捷键
nnoremap <leader>cg :cs find g<SPACE>
nnoremap <leader>cc :cs find c<SPACE>

" Terminal And tab
nnoremap <leader>te :terminal<CR>
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>ts :tabs<CR>
nnoremap <leader>tl :tabnext<CR>
nnoremap <leader>th :tabprevious<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tc :tabclose<CR>

" Git 相关的快捷键
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Git lg<CR>
