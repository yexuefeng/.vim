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
set fileencoding=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936


