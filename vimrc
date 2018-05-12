" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" vim -c "PlugInstall" -c "q" -c "q"

"""""""""""""""""""""""""""""""""""""""""""""""""
" 使用plug
"""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'      " 目录树插件
Plug 'vim-airline/vim-airline'  " 状态栏插件
Plug 'vim-airline/vim-airline-themes' " 状态栏主题插件
Plug 'joshdick/onedark.vim'     " 状态栏主题使用的颜色
Plug 'jiangmiao/auto-pairs'     " 自动补全引号括号
Plug 'vim-scripts/SuperTab'     " 提高Tab键能力的插件
"Plug 'vim-scripts/c.vim'        " 官方C语言插件
Plug 'rkulla/pydiction'         " 轻量级的Python补全插件
Plug 'luochen1990/rainbow'      " 为不同的括号添加颜色的插件
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""
" 实用设置
"""""""""""""""""""""""""""""""""""""""""""
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
set autoread        " 设置当文件被改动时自动载入
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 设置不兼容原始vi模式
filetype on              " 设置开启文件类型侦测
filetype plugin on       " 设置加载对应文件类型的插件
set noeb                 " 关闭错误的提示
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set scrolloff=3          " 光标移动到buffer的顶部和底部时保持3行距离 
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set cursorline           " 高亮显示当前行
set whichwrap+=<,>,h,l   " 设置光标键跨行
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面
set incsearch            " 实时搜索
set hlsearch             " 搜索时高亮
set mouse-=a             " 不允许使用鼠标操作
set noeb vb t_vb=        " 关闭终端响铃
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set expandtab            " 将制表符扩展为空格
set tabstop=4            " 设置编辑时制表符占用空格数
set shiftwidth=4         " 设置格式化时制表符占用空格数
set softtabstop=4        " 设置4个空格为制表符
set smarttab             " 在行和段开始处使用制表符
"set nowrap               " 禁止折行
set wrap                 " 自动折行
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set backspace=2          " 使用回车键正常处理indent,eol,start等
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set matchtime=1          " 匹配括号高亮的时间（单位是十分之一秒）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=syntax   " 设置基于语法进行代码折叠
set nofoldenable        " 关闭折叠代码
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding:utf-8 -*-")
        call append(line(".")+1,"# Author: yunfwe  date: ".strftime("%Y-%m-%d"))
        call append(line(".")+2, "") 
        call append(line(".")+3, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
        call append(line(".")+2, "")

        "    elseif &filetype == 'mkd'
        "        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."), "	> File Name: ".expand("%")) 
        call append(line(".")+1, "	> Author: yunfwe") 
        call append(line(".")+2, "	> Mail: 1441923087@qq.com") 
        call append(line(".")+3, "	> Created Time: ".strftime("%Y-%m-%d")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include <iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
        call append(line(".")+9, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include <stdio.h>")
        call append(line(".")+7, "")
        call append(line(".")+8, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
        call append(line(".")+9, "")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
nmap <Esc><Esc> :qa!<CR>      " 连续三个Esc不保存退出全部"
nmap <tab><tab> :w<CR>        " 连续两个Tab保存当前文件"
" 切换NERDTree 
map <F3> :NERDTreeToggle<CR>
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"B
"B
"Bdd
"B
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        "exec "!g++ % -o %<"
        "exec "!time ./%<"
        exec "!g++ % -o %< && time ./%<"
    elseif &filetype == 'cpp'
        "exec "!g++ % -std=c++11 -o %<"
        "exec "!time ./%<"
        exec "!g++ % -std=c++11 -o %< && time ./%<"
    elseif &filetype == 'java' 
        "exec "!javac %" 
        "exec "!time java %<"
        exec "!javac % && time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        "        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
    endif
endfunc
"代码调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
    exec "w"
    if &filetype == 'cpp'
        "exec "!g++ % -std=c++11 -g -o %<"
        "exec "!gdb ./%<"
        exec "!g++ % -std=c++11 -g -o %< && gdb ./%<"
    elseif &filetype == 'c'
        "exec "!gcc % -g -o %<"
        "exec "!gdb ./%<"
        exec "!gcc % -g -o %< && gdb ./%<"
    elseif &filetype == 'python'
        exec "!python -m pdb %"
    elseif &filetype == 'go'
        "exec "!go build -o %< %"
        "exec "!gdb ./%<"
        exec "!go build -o %< % && gdb ./%<"
    endif
endfunc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
let g:onedark_termcolors=256
colorscheme onedark

" airline
let g:airline_theme="onedark"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:NERDTreeFileExtensionHighlightFullName = 1
"let g:NERDTreeExactMatchHighlightFullName = 1
"let g:NERDTreePatternMatchHighlightFullName = 1
"let g:NERDTreeHighlightFolders = 1          
"let g:NERDTreeHighlightFoldersFullName = 1  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pydiction 
let g:pydiction_location = '~/.vim/plugged/pydiction/complete-dict'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" rainbow
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle
