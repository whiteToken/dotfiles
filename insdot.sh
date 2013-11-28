#!/bin/bash

cp .vimrc ~/
cp -rv .vim ~/
cp -rv .fonts ~/

mkdir -p ~/.config/fontconfig/conf.d
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
