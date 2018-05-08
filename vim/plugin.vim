source ~/.vim/config/utils.vim

function! ConfigPlugin()
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

    call dein#add('ludovicchabant/vim-gutentags')
    call dein#add('vim-scripts/gtags.vim')
    if utils#isLinux()
      " c/c++ 加强
      call dein#add('Valloric/YouCompleteMe')
      call dein#add('rdnetto/YCM-Generator')
    endif
  
    call dein#add('majutsushi/tagbar') 
  
    call dein#add('rust-lang/rust.vim')
    call dein#add('keith/swift.vim')
  
    " Auto complete
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
      call dein#add('roxma/nvim-yarp')
      call dein#add('roxma/vim-hug-neovim-rpc')
    endif
    " deoplete source for vim
    call dein#add('Shougo/neco-vim')

    "Code snippet
    call dein#add('SirVer/ultisnips')
    call dein#add('honza/vim-snippets')
    
    " Themes
    call dein#add('sickill/vim-monokai')
    call dein#add('skielbasa/vim-material-monokai')
    call dein#add('dracula/vim')
    call dein#add('vim-scripts/Solarized')
  
    call dein#add('junegunn/goyo.vim', {'on_cmd': "goyo"})
    call dein#add('vim-voom/VOoM', 
                \ {'on_ft': ['vimwiki', 'markdown']})
    
    if utils#isMac()
      call dein#add('ybian/smartim')
    endif
    " required:
    call dein#end()
    call dein#save_state()
  endif
  
  command! PluginInstall :call InstallPlugin()
  
  command! PluginClean :call UninstallPlugin()
  
  filetype plugin indent on
  syntax enable


  call plugin#configSmartim()
  call plugin#configGutentags()
endfunction

function! InstallPlugin()
  if dein#check_install()
    call dein#install()
  else
    echo "no need to install plugin"
  endif
endfunction

function! UninstallPlugin()
  map(dein#check_clean(), "delete(v:val, 'rf')")
endfunction


fun! plugin#configSmartim()
  if utils#isMac()
    let g:smartim_default = 'com.apple.keylayout.ABC'
  endif
endf

" Config Gutentags
fun! plugin#configGutentags()
  " gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
  let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

  " 所生成的数据文件的名称
  let g:gutentags_ctags_tagfile = '.tags'

  " 同时开启 ctags 和 gtags 支持：
  let g:gutentags_modules = []
  if executable('ctags')
	let g:gutentags_modules += ['ctags']
   endif
  if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
  endif

  " 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
  let g:gutentags_cache_dir = expand('~/.cache/tags')

  " 配置 ctags 的参数
  let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
  let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
  let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
  
  " 如果使用 universal ctags 需要增加下面一行
  let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
  
  " 禁用 gutentags 自动加载 gtags 数据库的行为
  let g:gutentags_auto_add_gtags_cscope = 0
endfunction
