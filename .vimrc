"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "#######################################################################") 
		call append(line(".")+1, "	#'''	")
		call append(line(".")+2, "	#> File Name: ".expand("%")) 
		call append(line(".")+3, "	#> Author: cyf") 
		call append(line(".")+4, "	#> Mail: XXX@qq.com") 
		call append(line(".")+5, "	#> Created Time: ".strftime("%c")) 
		call append(line(".")+6, "	#'''	")		
		call append(line(".")+7, "#######################################################################") 
		call append(line(".")+8, "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "#######################################################################") 
		call append(line(".")+2, "#	> File Name: ".expand("%")) 
		call append(line(".")+3, "#	> Author: cyf") 
		call append(line(".")+4, "#	> Mail: XXX@qq.com") 
		call append(line(".")+5, "#	> Created Time: ".strftime("%c")) 
		call append(line(".")+6, "#######################################################################") 
		call append(line(".")+7, "")
	

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line(".")+1,"# encoding: utf-8")
		call append(line(".")+2, "/*************************************************************************") 
		call append(line(".")+3, "	> File Name: ".expand("%")) 
		call append(line(".")+4, "	> Author: cyf") 
		call append(line(".")+5, "	> Mail: XXX@qq.com") 
		call append(line(".")+6, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+7, "************************************************************************/") 
		call append(line(".")+8, "")
    else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: cyf") 
		call append(line(".")+2, "	> Mail: XXX@qq.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, "************************************************************************/") 
		call append(line(".")+5, "")
	endif
    if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
    endif
    if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <stdlib.h>")
		call append(line(".")+8, "#include <string.h>")
		call append(line(".")+9, "")
    endif
    if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "")
		call append(line(".")+9, "")
		call append(line(".")+10, "")
		call append(line(".")+11, "#endif")
    endif
    if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" 不要图形按钮 
set go=              
" 设置字体  
set guifont=Courier_New:h10:cANSI 
" 输入的命令显示出来
set showcmd           
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 设置配色方案
colorscheme ron

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"共享剪贴板  
set clipboard+=unnamedplus 
"在处理未保存或只读文件的时候，弹出确认
set confirm
"不让vim发出讨厌的滴滴声
set noerrorbells
"在搜索的时候忽略大小写
"set ignorecase
"从不备份  
set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
"set ruler                   " 打开状态栏标尺
"set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 设置在状态行显示的信息
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set foldcolumn=0
"set foldmethod=indent 
"set foldlevel=3 
"set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"行内替换
set gdefault
"编码设置
let &termencoding=&encoding
set fileencodings=utf-8,gb18030,gbk
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set mouse=v
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
au BufRead,BufNewFile *  setfiletype txt

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>
nmap <F9> <Esc>:!ctags -R --c-kinds=+p --fields=+iaS --extra=+q *<CR> 

" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
map <C-c> y 
"列出当前目录文件  
map <F2> :tabnew .<CR>  
"打开树状文件目录  
map <C-F2> \be 
"去空行  
nnoremap <F4> :g/^\s*$/d<CR>  
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!java %<"
	elseif &filetype == 'sh'
		exec "!chmod a+x %"  
		exec "!./%"
	elseif &filetype == 'python'
		exec "!python %"
	endif
endfunc
map <F6> :TlistToggle<CR>
map <F7> :NERDTreeToggle<CR> 
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc
map <F9> :call SaveInputData()<CR>
func! SaveInputData()
	exec "tabnew"
	exec 'normal "+gP'
	exec "w! /tmp/input_data"
endfunc


filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

"Tlist
let g:Tlist_Show_One_File=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Use_Right_Window=1
let g:EchoFuncKeyPrev="<F3>"
let g:EchoFuncKeyNext="<F4>"

"winManager setting
"map <F8> :WMToggle<cr>
let g:winManagerWindowLayout='TagList|FileExplorer|BufExploer'
let g:persistentBehaviour=0
let g:winManagerWidth=30

"NERDtee设定
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=31

if &term == "xterm"
	set t_Co=8
	set t_Sb=^[[4%dm
	set t_Sf=^[[3%dm
endif
let g:neocomplcache_enable_at_startup = 1

"--omnicppcomplete setting --
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 "autocomplete with .
let OmniCpp_MayCompleteArrow = 1 "autocomplete with ->
let OmniCpp_MayCompleteScope = 1 "autocomplete with ::
let OmniCpp_SelectFirstItem = 2 "select first item(but don't insert)
let OmniCpp_NamespaceSearch = 2 "search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 "show function prototype in popup window
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_DefaultNameSpaces=["std"]

set autochdir
set tags+=/usr/include/qt4/tags

"""""""""""""""""""""""cscope设置""""""""""""""""""      
set cscopequickfix=s-,c-,d-,i-,t-,e-    
if has("cscope")    
	set csprg=/usr/bin/cscope    
	set csto=1    
	set cst    
	set nocsverb    
	" add any database in current directory     
	if filereadable("cscope.out")    
   		cs add cscope.out    
	endif    
	set csverb    
endif    
  
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>  
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>  

"""""""""""""""""""YouCompleteMe设置"""""""""""""""""" 

let g:ycm_global_ycm_extra_conf = '~/.vim/data/ycm/.ycm_extra_conf.py'


"BundleList              -列举列表(也就是.vimrc)中配置的所有插件  
"BundleInstall          -安装列表中的全部插件  
"BundleInstall!         -更新列表中的全部插件  
"BundleSearch foo   -查找foo插件  
"BundleSearch! foo  -刷新foo插件缓存  
"BundleClean           -清除列表中没有的插件  
"BundleClean!          -清除列表中没有的插件  

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'Auto-Pairs'
"YouCompleteMe已经集成了syntastic
"Bundle 'scrooloose/syntastic'
Bundle 'https://github.com/wincent/command-t.git'
Bundle 'https://github.com/ervandew/supertab.git'
Bundle 'Valloric/YouCompleteMe'

"迅速定位文件
"map <F3> :CtrlP<CR>
Bundle 'kien/ctrlp.vim'
"ctrlp设置
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     "MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  "Windows
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

"用于美化状态栏
Bundle 'Lokaltog/vim-powerline'

"nerdcommenter主要功能是方便的写注释
map <F1> <leader>ci <CR>
Bundle 'The-NERD-Commenter'

"indentLine是一款缩进指示线，由纯字符实现，效果比较完美
Bundle 'Yggdroot/indentLine'
let g:indentLine_char = '¦'

Bundle "drmingdrmer/xptemplate.git"
let g:xptemplate_key = '<C-\>'

"python-mode是封装了pylint、rope、pydoc、pep8和mccabe的vim插件
"Bundle 'python-mode-klen'
"python-mode
"开启警告
"let g:pymode_warnings = 0
"保存文件时自动删除无用空格
"let g:pymode_trim_whitespaces = 1
"let g:pymode_options = 1
"显示允许的最大长度的列
"let g:pymode_options_colorcolumn = 1
"设置QuickFix窗口的最大，最小高度
"let g:pymode_quickfix_minheight = 3
"let g:pymode_quickfix_maxheight = 10
"使用python3
"let g:pymode_python = 'python2'
"使用PEP8风格的缩进
"let g:pymode_indent = 1
"取消代码折叠
"let g:pymode_folding = 0
"开启python-mode定义的移动方式
"let g:pymode_motion = 1
"启用python-mode内置的python文档，使用K进行查找
"let g:pymode_doc = 1
"let g:pymode_doc_bind = 'K'
"自动检测并启用virtualenv
"let g:pymode_virtualenv = 1
"不使用python-mode运行python代码
"let g:pymode_run = 0
"let g:pymode_run_bind = '<Leader>r'
"不使用python-mode设置断点
"let g:pymode_breakpoint = 0
"let g:pymode_breakpoint_bind = '<leader>b'
"启用python语法检查
"let g:pymode_lint = 1
"修改后保存时进行检查
"let g:pymode_lint_on_write = 0
"编辑时进行检查
"let g:pymode_lint_on_fly = 0
"let g:pymode_lint_checkers = ['pyflakes', 'pep8']
"发现错误时不自动打开QuickFix窗口
"let g:pymode_lint_cwindow = 0
"侧边栏不显示python-mode相关的标志
"let g:pymode_lint_signs = 0
"let g:pymode_lint_todo_symbol = 'WW'
"let g:pymode_lint_comment_symbol = 'CC'
"let g:pymode_lint_visual_symbol = 'RR'
"let g:pymode_lint_error_symbol = 'EE'
"let g:pymode_lint_info_symbol = 'II'
"let g:pymode_lint_pyflakes_symbol = 'FF'
"启用重构
"let g:pymode_rope = 1
"不在父目录下查找.ropeproject，能提升响应速度
"let g:pymode_rope_lookup_project = 0
"光标下单词查阅文档
"let g:pymode_rope_show_doc_bind = '<C-c>d'
"项目修改后重新生成缓存
"let g:pymode_rope_regenerate_on_write = 1
"开启补全，并设置<Ctrl+Space>为默认快捷键
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
"let g:pymode_rope_completion_bind = '<C-Space>'
"<C-c>g跳转到定义处，同时新建竖直窗口打开
"let g:pymode_rope_goto_definition_bind = '<C-c>g'
"let g:pymode_rope_goto_definition_cmd = 'vnew'
"重命名光标下的函数，方法，变量及类名
"let g:pymode_rope_rename_bind = '<C-c>rr'
"重命名光标下的模块或包
"let g:pymode_rope_rename_module_bind = '<C-c>r1r'
"开启python所有的语法高亮
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"高亮缩进错误
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"高亮空格错误
"let g:pymode_syntax_space_errors = g:pymode_syntax_all
"[[	Jump to previous class or function (normal, visual, operator modes)
"]]	Jump to next class or function (normal, visual, operator modes)
"[M	Jump to previous class or method (normal, visual, operator modes)
"]M	Jump to next class or method (normal, visual, operator modes)
"aC	Select a class. Ex: vaC, daC, yaC, caC (normal, operator modes)
"iC	Select inner class. Ex: viC, diC, yiC, ciC (normal, operator modes)
"aM	Select a function or method. Ex: vaM, daM, yaM, caM (normal, operator modes)
"iM	Select inner function or method. Ex: viM, diM, yiM, ciM 

"自动补全插件
Bundle 'davidhalter/jedi-vim'


let g:SuperTabDefaultCompletionType="context"

