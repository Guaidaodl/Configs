#!/bin/bash

work_path=$(pwd)
if [ $work_path="." ]; then
  script_path=$work_path
else
  script_path=$work_path/$(dirname $0)
fi

######################################################
#
# Clean vim config 
#
######################################################
function clean_vim_config() {
  echo ">>> clean vim config"

  rm ~/.vimrc
  rm -rf ~/.vim
}

######################################################
#
# Install vim config 
#
# Global:
#   script_path
#
######################################################
function install_vim_config() {
  echo ">>> start intall vim config"
  local vim_file=~/.vimrc
  
  echo create soft link to $script_path/vimrc
  ln -s $script_path/vim/vimrc ~/.vimrc

  local vim_config_folder=~/.vim/config
  mkdir -p ~/.vim/config
  ln -s $script_path/vim/plugin.vim $vim_config_folder/plugin.vim
  ln -s $script_path/vim/keymap.vim $vim_config_folder/keymap.vim
  ln -s $script_path/vim/utils.vim  $vim_config_folder/utils.vim
  
  echo "install vim-plug"
  
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  
  echo finish install vim config
  echo
}

echo
echo "配置文件的位置: $script_path"
echo

clean_vim_config
install_vim_config

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
