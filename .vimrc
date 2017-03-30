"==================================================
"
"basic seting
"
"==================================================
set nocompatible                "去掉讨厌的有关vi一致性模式
set nu                          "显示行号
filetype plugin on              "载入文件类型插件
"+++++++++++++++++++++鼠标与光标+++++++++++++++++++
set mouse=a                     "可以使用鼠标
set cursorline                  "高亮所在行
"+++++++++++++++++++++空白与缩进++++++++++++++++++++
set sw=4			            "缩进代码时缩进量为4
set ts=4			            "一个制表符长度为4
set et				            "编辑时把所有制表符替换为空格
set smarttab			        "在行首输入tab时插入宽度为sw的空白,在其他地方按ts处理
set smartindent 		        "开启新行时使用智能自动缩进
set softtabstop=4		        "统一缩进为4
set backspace=2			        "使回格键(backspace)正常处理indent,eol,start等
"++++++++++++++++++++++搜索设置+++++++++++++++++++++
set ignorecase smartcase	    "搜索时智能忽略大小写
set incsearch			        "输入搜索内容就显示搜索结果
set hlsearch 			        "搜索时高亮显示被找到的文本
"++++++++++++++++++++++配色与主题+++++++++++++++++++
syntax on
colorscheme desert
"++++++++++++++++++++解决乱码问题+++++++++++++++++++
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"++++++++++++++++++++++文件类型+++++++++++++++++++++
filetype on                     "检测文件类型
filetype indent on              "为特定文件类型载入相关缩进文件

au BufRead,BufNewFile *.{sh}   set filetype=sh
au BufRead,BufNewFile *.{c}    set filetype=c
au BufRead,BufNewFILE *.{py}   set filetype=python
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"+++++++++++++++++++++cscope设置++++++++++++++++++++
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
            cs add cscope.out
    elseif $CSCOPE_DB != ""
            cs add $CSOPE_DB
    endif
    set csverb
endif


"##############################################################################
"
"新建文件标题
"
"##############################################################################

"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
func SetTitle() 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
	    call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%:t")) 
		call append(line(".")+1, "	> Author: ye xuefeng") 
		call append(line(".")+2, "	> Mail: ") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:t:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:t:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
endfunc 
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

"===================================================
"
"键盘命令
"
"===================================================
set tags=tags,/usr/include/tags,~/.
set cscopequickfix=s-,c-,d-,i-,t-,e-        "使用quickfix显示cscope的结果
"cs add cscope.out ./                      "添加cscope.out文件及其路径
let mapleader="\<Space>"                    "将<Leader>键设置为空格
noremap \ <Space>                          
"在命令行模式和插入模式，<C-Z>可保存并退出
map! <C-Z> <Esc>ZZ                          
"将<C-A>快捷键映射为全选
map <C-A> <Esc>ggVG$

"选中状态下，Ctrl + c复制; Ctrl + v粘帖
map <C-v> "+p
map <C-c> "+y

"Ctrl + a保存文件
map <C-a> <Esc>:w<CR>

" 查找C代码符号
nmap <Leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>
" 查找本定义
nmap <Leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数的函数
nmap <Leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找本字符串
nmap <Leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找本egrep模式
nmap <Leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找本文件
nmap <Leader>f :cs find f <C-R>=expand("<cword>")<CR><CR>
" 查找包含本文件的文件
nmap <Leader>i :cs find i ^<C-R>=expand("<cword>")<CR><CR>
" 查找本函数调用的函数
nmap <Leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>
" gd 在函数内部跳转（局部变量）
nnoremap <C-]> g<C-]>

nmap <F5> :!find ./ -iname '*.c' -o -iname '*.cpp' -o iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
          \:!cscope -bR -i cscope.files -f cscope.out<CR>
          \:cs reset<CR>


noremap <F4> :Rgrep<CR><CR><CR>.[h,c]<CR><CR>

"##############################################################################
"
"插件
"
"##############################################################################
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" Valloric/YouCompleteMe BEGIN
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_show_diagnostics_ui = 0
" Valloric/YouCompleteMe END

" tpope/vim-fugitive BEGIN
" TODO 学习完git之后再来看这个插件的用途
Plugin 'tpope/vim-fugitive'                 
set statusline+=%{fugitive#statusline()}    " show Git hotness
" tpope/vim-fugitive END

" Yggdroot/indentLine BEGIN
Plugin 'Yggdroot/indentLine'
set t_Co=256
let g:indentLine_char='┊'                 " this feature only works with files whose encoding is UTF-8
" Yggdroot/indentLine END

" L9 BEGIN
" TODO 这个库有什么用途
Plugin 'L9'          
" L9 END

" Auto-Pairs BEGIN
" 和.操作有冲突，暂时屏蔽
" Plugin 'Auto-Pairs'
" Auto-Pairs END

" EasyMotion BEGIN
" 使用空格 + {w,f,F,b,e ...}
Plugin 'EasyMotion'
let g:EasyMotion_leader_key='<Space>'
" EasyMotion END

" FuzzyFinder BEGIN
" TODO  文件查找, 功能很强大，具体有待研究???太久没人维护了，是否有其它替代插件
"Plugin 'FuzzyFinder'
" FuzzyFinder END

" python-imports.vim BEGIN
" TODO 暂时不用python
" Plugin 'python-imports.vim'
" python-imports.vim END

" kien/ctrlp.vim BEGIN
" 使用<C-p>调用CtrlP, 帮助条目:ctrlp-commands, ctrlp-extensions, ctrlp-mappings, ctrlp-options
" Once CtrlP is open:
"    Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
"    Press <c-f> and <c-b> to cycle between modes.
"    Press <c-d> to switch to filename only search instead of full path.
"    Press <c-r> to switch to regexp mode.
"    Use <c-j>, <c-k> or the arrow keys to navigate the result list.
"    Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
"    Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
"    Use <c-y> to create a new file and its parent directories.
"    Use <c-z> to mark/unmark multiple files and <c-o> to open them.
Plugin 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_by_filename = 1
set wildignore+=*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif,*.o,*.ko,*.a,*.exe,*.dll,*.git,*.svn
nmap <Leader>pb :CtrlPBuffer<CR>
nmap <Leader>pp :CtrlP<CR>
nmap <Leader>pm :CtrlPMRU<CR>
" kien/ctrlp.vim END

" majutsushi/tagbar BEGIN
" TODO conflict with nerdtree and winmanager ??
Plugin 'majutsushi/tagbar'
let g:tagbar_width=35
let g:tagbar_autofocus=0
nmap <F6> :TagbarToggle<CR>
" majutsushi/tagbar END

" taglist.vim BEGIN
" 使用:Tlist打开
" Plugin 'taglist.vim'
" let Tlist_Show_One_File=1
" let Tlist_Exit_OnlyWindow=1
" taglist.vim END

" scrooloose/syntastic BEGIN
" TODO 有时间可以看一下
" Plugin 'scrooloose/syntastic'
" let g:syntastic_python_checkers=['pylint']
" let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
" scrooloose/syntastic END

" scrooloose/nerdcommenter BEGIN
" Vim plugin for intensely orgasmic commenting
" usage:[count]<leader>c<space> |NERDComToggleComment|
Plugin 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims = 1       " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1   " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDAltDelims_java = 1    " Set a language to use its alternate delimiters by default
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }   " Add your own custom formats or override the defaults
let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1    " Enable trimming of trailing whitespace when uncommenting
" scrooloose/nerdcommenter END

" vim-airline/vim-airline BEGIN
" lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_theme='molokai'                           " 配置主题：https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline#extensions#tabline#enabled = 1            " Smarter tab line
let g:airline#extensions#tabline#buffer_nr_show = 1     " 显示buffer的序号
let g:airline_powerline_fonts = 1                       " 以下配置分隔符，需要安装powerline字体
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'                           
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
" vim-airline END

" netrw.vim: 为自带插件
" - 返回上级目录; c 切换vim 当前工作目录正在浏览的目录
" d 创建目录; D 删除目录或文件
" i 切换显示方式; R 文件或目录重命名
" s 选择排序方式; x 定制浏览方式, 使用你指定的程序打开该文件

" scrooloose/nerdtree BEGIN
" TODO 因为直接从github上装的和tagbar冲突，所以直接用的NERD_tree.vim
" nerdtree: A tree explorer plugin for vim???conflict with tagbar and winmanager
" Plugin 'scrooloose/nerdtree'
let NERDTreeIgnore=['.*\.pyc$','.*\.o$','.*\.ko$']  " 忽略.pyc .o .ko 结尾的文件
" 列出当前目录文件
nnoremap <silent> <F3> :NERDTreeToggle<CR>
" autocmd vimenter * if !argc() | NERDTree | endif    "当打开vim且没有文件时自动打开NERDTree
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" scrooloose/nerdtree END


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" 常用的帮助命令: g; 
" vimdiff, svndiff
