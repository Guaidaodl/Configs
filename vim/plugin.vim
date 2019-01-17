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
  
  Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }  
  
  Plug 'neomake/neomake'

  call plug#end()
  
  
  """""""""""""""""""""""""""插件相关设置
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

  """ LanguageClient
  set hidden

  let g:LanguageClient_serverCommands = {
        \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ }
  nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
  nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

  "deoplete
  let g:deoplete#enable_at_startup = 1

  "neomake
  " 写入文件后检查
  " call neomake#configure#automake('w')

  """""""""""""""""""""""插件设置结束
endfunction

