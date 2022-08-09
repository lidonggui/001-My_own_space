" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden     " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set number       "在左侧行号
set nobackup     "覆盖文件时不备份
set cursorline   "突出显示当前行

set autoindent   "自动缩进

" Backspace deletes like most programs in insert mode
set backspace=2

" show the cursor position al the time
set ruler        "在右下角显示光标位置的状态行

" Display incomplete commands
set showcmd

" Set file-encodings
set fileencodings=ucs-bom,utf8,cp936,gb2312,gb18030,big5

set background=dark
set encoding=utf-8
set fenc=utf-8

" 设置自动缩进
set smartindent
set autoindent

set cul
set linespace=2
set showmatch

" font and size
" set guifont=Andale Mono:h14
" set guifont=Monaco:h11
set guifont=Menlo:h14

" Softtabs, 4 space
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4
set expandtab
set smarttab

" Highlight current line
au WinLeave * set nocursorline
au WinEnter * set cursorline
set cursorline

" 按键映射 -- map
" 自动补全
inoremap " ""<Esc>i
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>

function ClosePair(char)
if getline('.')[col('.') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf

" 快捷移动光标---InsertModel
inoremap <C-L> <Esc>la
inoremap <C-H> <Esc>ha
inoremap <C-J> <Esc>ja
inoremap <C-K> <Esc>ka
imap ,, <Esc>la
imap .. <Esc>2la

"列出当前目录文件
map <F3> :tabnew .<CR>
"打开树状文件目录
map <C-F3> \be


autocmd InsertEnter * se cul    " 用浅色高亮当前行

set nocompatible  " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

"""""新文件标题"""""""
"新建.c,.h,.sh,.java文件，自动插入文件头

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.c exec ":call SetTitle()"

""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\########################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ma6174")
        call append(line(".")+2, "\# mail: ma6174@163.com")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\########################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/****************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: ma6174")
        call append(line(".")+2, "    > Mail: ma6174@163.com ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ****************************************/")
        call append(line(".")+5, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif

    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

" 设置当文件被改动时自动载入
set autoread

" 代码补全
set completeopt=preview,menu

"允许插件
filetype plugin on

" 历史记录数
set history=1000

"搜索逐字符高亮
set hlsearch
set incsearch

"搜索忽略大小写
set ignorecase

" 设置 CommandLine 的高度
:set cmdwinheight=10
