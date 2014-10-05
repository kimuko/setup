#!/bin/sh

cd ~/setup
cp -pR vim ~/.vim
ln -s .vim/vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
vim -u ~/.vimrc -i NONE -c "try | NeoBundleUpdate! | finally | q! | endtry" -e -s -V1
cp ~/.vim/original/hybrid.vim ~/.vim/bundle/vim-hybrid/colors/
