source ~/.vim/config/utils.vim

function! ConfigPlugin()
  call plug#begin('~/.vim/plug')
  
  " Add or remove your plugins here:
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Yggdroot/LeaderF'
  Plug 'vim-scripts/vim-auto-save'
  
  " Git 
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  
  Plug 'nathanaelkane/vim-indent-guides'
 
  " Markdown
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown'
 
  Plug 'vim-scripts/gtags.vim'
  
  Plug 'majutsushi/tagbar' 
  
  "Code snippet
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  
  " Themes
  Plug 'sickill/vim-monokai'
  Plug 'skielbasa/vim-material-monokai'
  Plug 'dracula/vim'
  Plug 'vim-scripts/Solarized'
  
  " ale
  Plug 'w0rp/ale'
    
  call plug#end()
endfunction
