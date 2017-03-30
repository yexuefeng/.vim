#!/bin/bash

echo "Seting Vim will take some time. Please be Patient ^_^" 
rm -rf ~/.vim_old/
mv -f ~/.vim ~/.vim_old
cd ~/ && git clone https://github.com/yexuefeng/.vim.git
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
CSCOPEPATH=`which cscope`
sed -i "s%/usr/local/bin/cscope%$CSCOPEPATH%" ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "yexuefeng try hard to help you install bundle application" > yexuefeng
echo "After installation finished, this script will exit" >> yexuefeng
echo "Please be paitent" >> yeuxuefeng
echo "YouCompleteMe need extra settings:https://github.com/Valloric/YouCompleteMe" >> yexuefeng
echo "Finish!"
     
