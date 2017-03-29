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
"+++++++++++++++++++++cscope设置++++++++++++++++++++
if has("cscope")
    set csprg=CSCOPE_PATH
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
          \:!cscope -b -i cscope.files -f cscope.out<CR>
          \:cs reset<CR>
