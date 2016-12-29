
set nocompatible              " be iMproved
filetype off                  " required!
filetype plugin indent on     " required!
set nu
syntax on                     " 开启语法高亮
set fileencodings=utf-8,gbk   " 解决中文编码问题

set backspace=indent,eol,start " 保证退格键可以正常工作
set noswapfile                " 不产生swp文件
set nobackup
set nowritebackup

set autoread                  " 文件变化时可以实时刷新
autocmd! bufwritepost .vimrc source %

" vim编辑的文件被其他进程修改时会自动同步，需等待4秒,也可执行:e命令
:au CursorHold * checktime	 

set hlsearch				  " 高亮搜索文本

set omnifunc=syntaxcomplete#Complete " omni-complete

set shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
:set modifiable
:colorscheme desert

" 显示行号，设置每行的宽度
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" 撤销的设置
set history=700
set undolevels=700

:set mouse=a 				  " 启动鼠标 on OSX press ALT and click
set pastetoggle=<F2>		  " 粘贴大文件时先按F2，效果更好
set clipboard=unnamed

let mapleader = ","

" ctrl+n 去掉最后一次搜索的高亮
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" 快速保存，CTRL + z
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" 快速退出
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows

" 在切割的window间切换
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" 进入视图模式后对选中的文本进行缩进的修改
" 可以进行多次操作
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" 去掉报错响声
set vb t_vb=

""""""""""""""""""""""
    "Quickly Run
""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
	elseif &filetype == 'html'
		exec "!firefox % &"
	elseif &filetype == 'go'
		exec "!time go run %"
	elseif &filetype == 'mkd'
		exec "!~/.vim/markdown.pl % > %.html &"
		exec "!firefox %.html &"
	endif
endfunc


set rtp+=~/.vim/bundle/vundle/ " Vundle setting
call vundle#begin()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1                 " 显示书签
let NERDTreeIgnore=['\.\.$', '\.$', '\~$']  " 不显示.和..路径
autocmd vimenter * NERDTree   "启动vim时自动打开NERTree
Bundle 'jistr/vim-nerdtree-tabs'

" python-mode配置 不再使用
"" Bundle 'klen/python-mode'
"" let g:pymode_rope = 0
"" let g:pymode_rope_autoimport = 0

Bundle 'davidhalter/jedi-vim'
let g:jedi#use_tabs_not_buffers = 1

Plugin 'panozzaj/vim-autocorrect'
Plugin 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
let g:Powerline_symbols = 'fancy'
set encoding=utf-8

call vundle#end()
" auto correction
iabbrev uplaoder uploader 
iabbrev Uplaoder Uploader 
