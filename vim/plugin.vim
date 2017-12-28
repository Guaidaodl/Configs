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
