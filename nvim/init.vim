set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc

if exists(':tnoremap')
    tnoremap jk <C-\><C-n>
endif
