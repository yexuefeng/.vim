#!/bin/bash

echo "Seting Vim will take some time. Please be Patient ^_^" 
rm -rf ~/.vim_old/
mv -f ~/.vim ~/.vim_old
cd ~/ && git clone https://github.com/yexuefeng/.vim.git
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
CSCOPEPATH=`which cscope`
sed -i "s%CSCOPE_PATH%$CSCOPEPATH%" ~/.vimrc
echo "Finish!"
     
