" run this to remove existing .vimrc
" :!rm ~/.vimrc
" then run this to make a soft link to this file
" :!ln -s ~/vim/vimrc ~/.vimrc
" run this to install vundle
" :!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" restart vim and then run this to download all the plugins in this file
" :PlugInstall
"
" or just type
" vim +PlugInstall
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
"or for short :so %
"
"
set encoding=utf-8
set nocompatible              " be iMproved, required
" use these for profiling how vim uses resources
"profile start ~/Documents/profile.log
"profile func *
"profile file *
"
"


call plug#begin()
"Colour schemes
"Plug 'rafi/awesome-vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jdsimcoe/abstract.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'rakr/vim-one'
Plug 'tomasiser/vim-code-dark'
Plug 'baskerville/bubblegum'
function! Miamineon(x)
!mkdir ~/.vim/colors/
!cp ~/.vim/plugged/miamineon/miamineon.vim ~/.vim/colors/
!cp ~/.vim/plugged/miamineon/miamineon-airline.vim ~/.vim/plugged/vim-airline-themes/autoload/airline/themes/miamineon.vim
endfunction
Plug 'keelbeelveel/miamineon', { 'do': function('Miamineon')}
Plug 'nanotech/jellybeans.vim'
Plug 'ethantrithon/elementary.vim'
Plug 'mrkn/mrkn256.vim'
"git automation
Plug 'tpope/vim-fugitive'
"branch viewer for git
Plug 'sodapopcan/vim-twiggy'
"nerdtree filesystem viewer
"Plug 'preservim/nerdtree'
"fern filesystem viewer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
"info at bottom of buffer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"syntax error highlighting
" :help syntastic
"for more info
Plug 'scrooloose/syntastic'
"automatic ctags generation
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'universal-ctags/ctags'
"Plug 'ludovicchabant/vim-gutentags'
"tagbar to navigate tags
Plug 'preservim/tagbar'
"also shows tags but I find tagbar works better
"EXCEPT vista shows TOC for simplenote notes 
"and tagbar doesn't
Plug 'liuchengxu/vista.vim'
"automatic closing of quotes, parentheses etc
Plug 'Raimondi/delimitMate'
"adds easier window navigation with ctrl+direction
"Plug 'christoomey/vim-tmux-navigator'
"autocloses html tags
Plug 'vim-scripts/HTML-AutoCloseTag'
"shows buffers open at top
"Plug 'fholgado/minibufexpl.vim'
"ctrl+p fuzzy file search
"Plug 'ctrlpvim/ctrlp.vim'
"FZF fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'LumaKernel/fern-mapping-fzf.vim'
"shows colors of hex codes
Plug 'lilydjwg/colorizer'
"syntax highlighting for many languages
"Plug 'sheerun/vim-polyglot'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'vim-scripts/SQLUtilities'
"this is for reading GPG encrypted files
Plug 'jamessan/vim-gnupg'
"show tabs at top
"Plug 'mkitt/tabline.vim'
"enhances tabline
"Plug 'webdevel/tabulous'
"track vim usage in wakatime
Plug 'wakatime/vim-wakatime'
"edit subtitles files
Plug 'ggandor/vim-srt-sync'
"these two work together to display markdown files, with folding and toc
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
"view and edit SimpleNote notes
Plug 'simplenote-vim/simplenote.vim'
"view git changes
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
"Snippets - completion menu
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"asynchronous lint engine
Plug 'dense-analysis/ale'
"fancy start screen
Plug 'mhinz/vim-startify'
" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
set smartindent
runtime macros/matchit.vim
set t_Co=256
"let g:solarized_termcolors=256
"Set the colorscheme
"colorscheme miamineon
"let g:airline_theme = 'miamineon'
"colorscheme tokyonight
"colorscheme PaperColor
colorscheme abstract
set background=dark

"set leader as space
let mapleader = " "
"------ fern settings -----
let g:fern#renderer = "nerdfont"
"let g:fern#disable_default_mappings = 1
"toggle fern with <leader> f
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=25 <CR><C-w>=
"Start fern.vim on Vim startup with current directory
""augroup my-fern-startup
""	autocmd! *
""	autocmd VimEnter * ++nested Fern -drawer -toggle -reveal=% -width=25 .
""augroup END
"custom mappings
function! FernInit() abort
	nmap <buffer><expr>
				\ <Plug>(fern-my-open-expand-collapse)
				\ fern#smart#leaf(
				\   "\<Plug>(fern-action-open:select)",
				\   "\<Plug>(fern-action-expand)",
				\   "\<Plug>(fern-action-collapse)",
				\ )
	nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
	nmap <buffer> <2-LeftMouse> <Plug>(fern-my-open-expand-collapse)
	nmap <buffer> n <Plug>(fern-action-new-path)
	nmap <buffer> m <Plug>(fern-action-move)
	nmap <buffer> M <Plug>(fern-action-rename)
	nmap <buffer> r <Plug>(fern-action-reload)
	nmap <buffer> <C-o> <Plug>(fern-action-open:split)
	nmap <buffer> <C-e> <Plug>(fern-action-open:vsplit)
	"Perform tcd on the root node after enter or leave action
	nmap <buffer> <Plug>(fern-my-enter-and-tcd)
				\ <Plug>(fern-action-enter)
				\ <Plug>(fern-wait)
				\ <Plug>(fern-action-tcd:root)
	nmap <buffer> <Plug>(fern-my-leave-and-tcd)
				\ <Plug>(fern-action-leave)
				\ <Plug>(fern-wait)
				\ <Plug>(fern-action-tcd:root)
	nmap <buffer> > <Plug>(fern-my-enter-and-tcd)
	nmap <buffer> < <Plug>(fern-my-leave-and-tcd)
endfunction
augroup FernGroup
	autocmd!
	autocmd FileType fern call FernInit()
augroup END
"glyph-palette  colours
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
"""" ----- FZF ----
""""open in splits and new tabs with Ctrl t/o/e
""""Tab/hOrizontal/vErtical
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-o': 'split',
      \ 'ctrl-e': 'vsplit'
  \ }
""""search file names
nnoremap  <leader>s :Files<CR>
""""search inside files
nnoremap <Leader>i :RG<CR>
""""search buffers
nnoremap <Leader>b :Buffers<CR>
""""search in current buffer
nnoremap  <Leader>/ :BLines<CR>
""""search help
nnoremap  <Leader>h :Helptags<CR>
""""history of Recently opened files
nnoremap  <Leader>r :History<CR>
"search for my own mapped commands
nnoremap  <Leader>m :Maps<CR>^<space<space>vimrc<space>
""""search for tags in the current buffer
nnoremap  <Leader>t :BTags<CR>
""""use ripgrep instead of grep by default in vim
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
""""make :Rg only search for file contents, not file names as well
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
""""better ripgrep integration, call RG instead of Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"""" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'border': 'sharp'} }

"""" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }




" ---- Vista.vim ----
nnoremap <leader>v :Vista!!<CR>
"nnoremap <leader>t :Vista finder<CR>
"let g:vista_fzf_preview = ['right:50%']
"let g:vista_keep_fzf_colors = 1
"let g:vista_default_executive = 'ctags'
" ----- gutentags -----
set statusline+=%{gutentags#statusline()}
" ----- vim-airline settings -----
" Always show statusbar
set laststatus=2
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1
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
" ----- simplenote settings ---
:source ~/Documents/me/security/simplenote.txt
"let g:SimplenoteSingleWindow=1
let g:SimplenoteVertical=1
let g:SimplenoteListSize=70
let g:SimplenoteFiletype="markdown"
let g:SimplenoteNoteFormat="%F%-40N%>[%T][%D]"
"let g:SimplenoteStrftime="%a, %d %b %Y %H:%M:%S"
let g:SimplenoteStrftime="%d-%m-%y %H:%M:%S"
"open Simplenote
"cnoreabbrev sn call OpenSimplenote()
command! -nargs=* SN call OpenSimplenote(<f-args>)
function! OpenSimplenote(...)
	let s:tags = ""
	let n = 1
	let s:totalargs = a:0
	if s:totalargs > 0
		for n in range(1, s:totalargs)
			let s:tags = s:tags.",".get(a:, n, 0)
			"echo s:tags
		endfor
	endif
	let s:winids = win_findbuf(bufnr('Simplenote'))
	if len(s:winids) > 0
		call win_gotoid(s:winids[0])
		execute 'SimplenoteList' s:tags
	else
		tabnew
		execute 'SimplenoteList' s:tags
	endif
endfunction
"new note
cnoreabbrev SNN call SimplenoteNew()
function! SimplenoteNew()
	let s:winids = win_findbuf(bufnr('Simplenote'))
	if len(s:winids) > 0
		call win_gotoid(s:winids[0])
		vnew
		SimplenoteNew
		SimplenoteList
	else
		tabnew
		SimplenoteNew
		SimplenoteList
	endif
endfunction
cnoreabbrev SNT SimplenoteTag
"save current buffer as note
"cnoreabbrev snw call SimplenoteSaveAsNote()
"function! SimplenoteSaveAsNote()
"save file if it is already a file
"open new tab for Simplenote or go to Simplenote tab
"open new buffer
"paste contents of previous buffer
"save as a note
"endfunction
"let s:totaltabs = tabpagenr("$")
"let s:tabs = 1
"for s:tabs in range(1,s:totaltabs)
"if gettabvar(s:tabs, bufnr("Simplenote")) > 0
"echo 'simplenote is open'
""":exe bnr . "wincmd w"
"else
"echo 'simplenote is not existent'
""silent execute 'split ' . a:buffername
"endif
"endfor
" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
"set tags=./tags;,~/.vimtags
let g:easytags_auto_highlight=0
"Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
"let g:tagbar_width=20
"let g:miniBufExplUseSingleClick = 1
"----- preservim/tagbar settings -----
"Open/close tagbar with <leader>a
nmap <leader>a :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
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
nnoremap <leader>= :keepjumps call DelBlank()<cr>
"switch on line numbering
"this is on so that toggling relative line numbering leaves
"normal line numbering instead of removing it completely
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
"noremap <leader>h :set hlsearch!<cr>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup=1
"au VimEnter *  NERDTree
"let NERDTreeShowBookmarks=1
"let g:NERDTreeWinSize=25
"let g:NERDTreeDirArrows=0
"hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
"hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
"let g:tablineclosebutton=1
"ctrl p searches dot files
"let g:ctrlp_show_hidden = 1
"noremap :h tab help
set ignorecase
set smartcase
set backupdir=~/.vim/backup//
set dir=~/.vim/swap//
set undodir=~/.vim/undo//
cnoreabbrev CS tab drop ~/vim/cheatsheet.md <cr> :help<cr>
"my diff function for two already open tabs
fun! Diff(x, y)
	execute 'tab sb' a:x
	execute 'diffthis'
	execute 'vert sb' a:y
	execute 'diffthis'
endfunc
"
"trying to highlight and tab files with
"both html and php better
"augroup filetypedetect
""	au BufRead,BufNewFile *.php
""	if search('div')>0 |
""		set ft=phtml.html |
""	endif
" augroup END
"
"
"Shortcuts for git

nnoremap <leader>g :vertical Git<CR>
nnoremap <leader>d :Gvdiff<CR>
"navigate windows more easily
nnoremap <tab>h <C-w>h
nnoremap <tab>j <C-w>j
nnoremap <tab>k <C-w>k
nnoremap <tab>l <C-w>l

"This is called after all the plugins and 
"setttings in this vimrc file are loaded
function! After()
"""the Abstract colour scheme loads very aggressively
"""and doesn't have good diff colouring
"highlight DiffAdd ctermfg=NONE ctermbg=101 144 143 
highlight DiffAdd ctermfg=NONE ctermbg=143
highlight DiffChange ctermfg=NONE ctermbg=NONE
highlight DiffDelete ctermfg=196 ctermbg=NONE
highlight DiffText ctermfg=NONE ctermbg=143
endfunction


