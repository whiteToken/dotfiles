#!/bin/bash
# copy files for per user vim config

if [ ! $# -eq 0 ]; then
    cp -v .vimrc ~/
    cp -rv .vim ~/
    cp -rv .fonts ~/
    mkdir -pv ~/.config/fontconfig/conf.d
    cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d


    if [ $1 == "-i" ]; then
        git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
        git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    fi
    if [ $1 == "-g" ]; then
        git pull https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
        git pull https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
    fi

    echo "run fc-cache -fv to update fonts";
else
    echo "-i for initial install"
    echo "-g for update with git"
    echo "-u for update with out git" #anything but -i or -g will do
fi
