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
set encoding=UTF-8
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
inoremap " ""<Esc>i
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>

"列出当前目录文件
map <F3> :tabnew .<CR>
"打开树状文件目录
map <C-F3> \be

autocmd InsertEnter * se cul    " 用浅色高亮当前行

set nocompatible  " 去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

" 设置当文件被改动时自动载入
set autoread

" 代码补全
set completeopt=preview,menu

" 历史记录数
set history=1000

"搜索逐字符高亮
set hlsearch
set incsearch

"搜索忽略大小写
set ignorecase


"允许插件
filetype plugin on

" plugin's
" NERDtree
call plug#begin()
Plug 'preservim/nerdtree'   "folder tree
Plug 'neoclide/coc.nvim', {'branch': 'release'}     "autoindent
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }   "Finder
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'               "be beautiful
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'                       "icons
call plug#end()

map <C-n> :NERDTreeToggle<CR>

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

set laststatus=2  "永远显示状态栏
let g:molokai_original = 1
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1    "显示窗口tab和buffer
let g:airline_theme='badwolf'  " murmur配色不错

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = ' | '
let g:airline_symbols.branch = '⎇'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }}

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
