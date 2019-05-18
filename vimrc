" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
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
"syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""""""""""""""""GENERAL""""""""""""""""""
set nocp
set nocompatible
filetype off
syntax on

set encoding=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
set helplang=cn

set hidden
set backspace=indent,eol,start
set number
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

set history=1000
set nobackup
set noswapfile
set ignorecase
set hlsearch
set incsearch
set scrolloff=5

"""""""""""""""代码折叠"""""""""""""""
set foldmethod=indent
set foldlevel=99
"空格实现展开与收缩代码
nnoremap <space> za


"""""""""""""""""插件""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'git://github.com/VundleVim/Vundle.vim'			"插件管理
Plugin 'git://github.com/scrooloose/nerdtree.git'		"目录树
Plugin 'git://github.com/jistr/vim-nerdtree-tabs.git'	"目录树补全
Plugin 'git://github.com/ervandew/supertab.git'			"自动补全
Plugin 'git://github.com/jiangmiao/auto-pairs.git'		"括号自动补齐
Plugin 'git://github.com/vim-scripts/gdbmgr.git'		"调试器
Plugin 'git://github.com/godlygeek/tabular.git'			"对齐工具
Plugin 'git://github.com/plasticboy/vim-markdown.git'	"markdown语法支持
Plugin 'git://github.com/iamcco/markdown-preview.vim'	"markdown预览
Plugin 'git://github.com/suan/vim-instant-markdown'		"markdown网页实时预览
"Plugin 'git://github.com/Lokaltog/vim-powerline'		"下方powerline
Plugin 'git://github.com/vim-scripts/ctags.vim'			"生成c语音的tags
"Plugin 'git://github.com/majutsushi/tagbar'				"生产tagbar
Plugin 'git://github.com/vim-airline/vim-airline'		"上方airline
Plugin 'git://github.com/vim-airline/vim-airline-themes' "airline主题
Plugin 'git://github.com/vim-scripts/taglist.vim.git'	"taglist
Plugin 'git://github.com/ctrlpvim/ctrlp.vim'			"ctrlp文件搜索
Plugin 'git://github.com/rking/ag.vim'					"文件搜索
Plugin 'git://github.com/terryma/vim-smooth-scroll'		"平滑滚动
Plugin 'git://github.com/airblade/vim-gitgutter'		"显示git更改
Plugin 'git://github.com/tpope/vim-fugitive'			"git命令支持


call vundle#end()
filetype plugin indent on

" python config
" 补全
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 5
" 高亮
let python_highlight_all=1



" Taglist config
map <F3> :Tlist<CR>
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
autocmd vimenter * Tlist

" terminal config
map <F4> :botright ter <CR>
"autocmd vimenter * botright ter ++rows=8

" NERDTree config
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")&&b:NERDTreeType == "primary") | q | endif
"第一条是说使用F2键快速调出和隐藏它；
"第二条是关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!。
"如果想打开vim时自动打开NERDTree，可以如下设定
autocmd vimenter * vertical botright NERDTree
wincmd w
autocmd VimEnter * wincmd w

" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
"let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=25
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1

" Markdown-preview config
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
nmap <silent> <F9> <Plug>StopMarkdownPreview

" Airline config
" 设置为双字宽显示，否则无法完整显示如:☆
"set ambiwidth=double
"set laststatus=2
"永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 "显示窗口tab和buffer
let g:airline_theme='solarized'
"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决consle输出乱码
"set termencoding = cp936  
" 设置中文提示
language messages zh_CN.utf-8 
" 设置中文帮助
set helplang=cn
" 映射切换buffer的键位
nnoremap n :bp<CR>
nnoremap m :bn<CR>
" 设置字体 
set guifont=Powerline_Consolas:h14:cANSI
set t_Co=256     "终端开启256色支持"

"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1

" 切换buffer
"nnoremap <C-N> :bn<CR>
"nnoremap <C-P> :bp<CR>

let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ''   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1    

" ctrlp config
"<Leader>p搜索当前目录下文件
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>f搜索MRU文件
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
"默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 0
"自定义搜索列表的提示符
let g:ctrlp_line_prefix = '♪ '

"调用ag进行搜索提升速度，同时不使用缓存文件
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" smooth-scroll config
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>




"""""""""""""""""键盘命令""""""""""""""""
" 映射全选+复制 ctrl+a
map <C-A> ggVGY
map! <C-A> <Esc>ggVGY
map <F12> gg=G
" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y











