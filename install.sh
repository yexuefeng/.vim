#!/bin/bash
#从今往后，必定发奋图强
#依靠自己，照顾好父母

echo "Seting Vim will take some time. Please be Patient ^_^"
rm -rf ~/.vim_old/
mv -f ~/.vim ~/.vim_old
cd ~/ && git clone https://github.com/yexuefeng/.vim.git
mv -f ~/.vimrc ~/.vimrc_old
mv -f ~/.vim/.vimrc ~/
echo "Finish!"
     
