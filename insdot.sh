#!/bin/bash
# copy files for per user vim config

if [ ! $# -eq 0 ]; then
    if [ $1 == "-u" ]; then
        cp -v .vimrc ~/
        cp -rv .vim ~/
        cp -rv .fonts ~/.local/share/fonts
        mkdir -pv ~/.config/fontconfig/conf.d
        cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
    fi

    if [ $1 == "-r" ]; then
        cp -v .vimrcRoot ~/.vimrc
    fi

    if [ $1 == "-i" ]; then
        git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
        git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
        git clone https://github.com/rust-lang/rust.vim.git
        git clone https://github.com/phildawes/racer.git
        cp -v .vimrc ~/
        cp -rv .vim ~/
        cp -rv .fonts ~/.local/share/fonts
        mkdir -pv ~/.config/fontconfig/conf.d
        cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

    fi
    if [ $1 == "-g" ]; then
        git pull https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
        git pull https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
        git pull https://github.com/rust-lang/rust.vim.git
        git pull https://github.com/phildawes/racer.git
    fi

    echo "run fc-cache -fv to update fonts";
else
    echo "-i for initial install"
    echo "-g for update with git"
    echo "-u for update with out git"
    echo "-r for beter root user config"
fi
