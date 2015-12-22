#!/bin/bash
# copy files for per user vim config

if [ ! $# -eq 0 ]; then
    if [ $1 == "-u" ]; then
        cp -v vimrc ~/.vimrc
        cp -rv vim ~/.vim
        cp -rv fonts ~/.local/share/fonts
        mkdir -pv ~/.config/fontconfig/conf.d
        cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
    fi

    if [ $1 == "-r" ]; then
        cp -v vimrcRoot ~/.vimrc
    fi

    if [ $1 == "-i" ]; then
        cp -v vimrc ~/.vimrc
        cp -rv vim ~/.vim
        cp -rv fonts ~/.local/share/fonts
        mkdir -pv ~/.config/fontconfig/conf.d
        cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d

        git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
        #git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
        git clone https://github.com/rust-lang/rust.vim.git ~/.vim/bundle/rust.vim
        git clone https://github.com/phildawes/racer.git ~/.vim/racer # this needs to be compiled and needs rust soruce code directory
        git clone https://github.com/racer-rust/vim-racer.git ~/.vim/bundle/vim-racer
    fi
    if [ $1 == "-g" ]; then
        # this chould be updated to loop through all the folders smartly
        cd ~/.vim/bundle/vim-airline && git pull 
        #cd ~/.vim/bundle/nerdtree    && git pull 
        cd ~/.vim/bundle/rust.vim    && git pull 
        cd ~/.vim/bundle/racer       && git pull 
        cd ~/.vim/bundle/vim-racer   && git pull 
    fi

    echo "run fc-cache -fv to update fonts";
else
    echo "-i for initial install"
    echo "-g for update with git"
    echo "-u for update with out git"
    echo "-r for beter root user config"
fi

