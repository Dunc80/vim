" run this to remove existing .vimrc
" :!rm ~/.vimrc
" then run this to make a soft link to this file
" :!ln -s ~/vim/vimrc ~/.vimrc
" run this to install vundle
" :!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" restart vim and then run this to download all the plugins in this file
" :PluginInstall
"
" or just type
" vim +PluginInstall
" from the terminal
"
"using the .vimrc file in your home folder will require -E
"when using sudo on some systems, or vim will give the default/root user settings
"eg sudo -E vim filename
"
"
"manually create the folder for swp files (~/.vim/swap/)
"manually create the folder for undo files (~/.vim/undo/)
"manually create the folder for backup files (~/.vim/backup/)
"
"to reload this file after editing it use :source %
"or for short :so%
"
"

set encoding=utf-8
set nocompatible              " be iMproved, required
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
"Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
Plugin 'sodapopcan/vim-twiggy'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
"automatic closing of quotes, parentheses etc
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'HTML-AutoCloseTag'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'lilydjwg/colorizer'
Plugin 'sheerun/vim-polyglot'
Plugin '2072/PHP-Indenting-for-VIm'
"Plugin 'stanangeloff/php.vim'
Plugin 'vim-scripts/SQLUtilities'
Plugin 'jamessan/vim-gnupg'
Plugin 'mkitt/tabline.vim'
Plugin 'webdevel/tabulous'
Plugin 'wakatime/vim-wakatime'
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
"
set smartindent
runtime macros/matchit.vim
set t_Co=256
"let g:solarized_termcolors=256
"Set the colorscheme
colorscheme elflord
"set background=dark
"" no one is really happy until you have this shortcuts
"cnoreabbrev W! w!
"cnoreabbrev Q! q!
"cnoreabbrev Qall! qall!
"cnoreabbrev Wq wq
"cnoreabbrev Wa wa
"cnoreabbrev wQ wq
"cnoreabbrev WQ wq
"cnoreabbrev W w
"cnoreabbrev Q q
"cnoreabbrev Qall qall
"
"
" ----- vim-airline settings -----
" Always show statusbar
set laststatus=2
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
if !exists('g:airline_powerline_fonts')
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline_left_sep          = '▶'
	let g:airline_left_alt_sep      = '»'
	let g:airline_right_sep         = '◀'
	let g:airline_right_alt_sep     = '«'
	let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
	let g:airline#extensions#readonly#symbol   = '⊘'
	let g:airline#extensions#linecolumn#prefix = '¶'
	let g:airline#extensions#paste#symbol      = 'ρ'
	let g:airline_symbols.linenr    = '␊'
	let g:airline_symbols.branch    = '⎇'
	let g:airline_symbols.paste     = 'ρ'
	let g:airline_symbols.paste     = 'Þ'
	let g:airline_symbols.paste     = '∥'
	let g:airline_symbols.whitespace = 'Ξ'
else
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = ''
	" powerline symbols
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
endif
" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
"set tags=./tags;,~/.vimtags
"Sensible defaults
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1
"let g:tagbar_width=20
"let g:miniBufExplUseSingleClick = 1
"----- majutsushi/tagbar settings -----
"Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
autocmd BufEnter * nested :call tagbar#autoopen(0)
" ----- Raimondi/delimitMate settings -----
"let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
" --- General settings ---
"set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch
syntax on
set mouse=a
set tabstop=2
set shiftwidth=2
set autoindent
"set smartindent
"let php_sql_query = 1
"let php_htmlInStrings = 1
syntax enable
fun! DelBlank()
	%s/\s\+$//e
	%s/\n\{2,}/\r/e
	normal gg=G
endfun
map <special> <leader>= :keepjumps call DelBlank()<cr>
"switch on line numbering
set nu
"switch on relative line numbering
"this leaves absolute line numbering on for the current line
set rnu
"function to toggle the relative line numbering
fun! NumberToggle()
	set rnu!
endfunc
nnoremap <C-n> :call NumberToggle()<cr>
"toggle search highlighting
noremap <leader>h :set hlsearch!<cr>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup=1
au VimEnter *  NERDTree
let NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrows=0
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
let g:tablineclosebutton=1
"ctrl p searches dot files
"let g:ctrlp_show_hidden = 1
"noremap :h tab help
set ignorecase
set smartcase
set backupdir=~/.vim/backup//
set dir=~/.vim/swap//
set undodir=~/.vim/undo//
cnoreabbrev cs tab drop ~/vim/cheatsheet.txt <cr> :help<cr>
fun! Diff(x, y)
	execute 'tab sb' a:x
	execute 'diffthis'
	execute 'vert sb' a:y
	execute 'diffthis'
endfunc
"augroup filetypedetect
""	au BufRead,BufNewFile *.php 
""	if search('div')>0 |
""		set ft=phtml.html |
""	endif
" augroup END
