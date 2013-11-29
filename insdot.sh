#!/bin/bash
# copy files for per user vim config

cp -v .vimrc ~/
cp -rv .vim ~/
cp -rv .fonts ~/

#one of these should be the font config dir
mkdir -pv ~/.config/fontconfig/conf.d
mkdir -pv ~/.fonts.conf.d
cp -v 10-powerline-symbols.conf ~/.config/fontconfig/conf.d
cp -v 10-powerline-symbols.conf ~/.fonts.conf.d
