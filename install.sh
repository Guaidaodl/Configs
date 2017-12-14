#!/bin/bash

work_path=$(pwd)
script_path=$work_path/$(dirname $0)

echo
echo "配置文件的位置: $script_path"
echo

#vim config
echo ">>> start intall vim config"
vim_file=~/.vimrc
if [ -f $vim_file ]; then
    echo "remove .vimrc"
    rm $vim_file
fi
echo create soft link to $script_path/vimrc
ln -s $script_path/vimrc ~/.vimrc

echo "install dein"
if [ -d ~/.vim/bundle ]; then
    rm -rf ~/.vim/bundle
fi

mkdir -p ~/.vim/bundle
dein_install_dir=~/.vim/bundle/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim $dein_install_dir

echo finish install vim config
echo

#nvim config
echo ">>>> start install nvim config"
nvim_path=~/.config/nvim

if [ -d $nvim_path ]; then
    rm -rf $nvim_path
    echo "remove old: $nvim_path"
fi
echo "create folder: $nvim_path"
mkdir -p "$nvim_path"

echo "create soft link"
ln -s $script_path/nvim/init.vim $nvim_path/init.vim

echo "finish install nvim config"
echo


