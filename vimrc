"using the .vimrc file in your home folder will require -E
"when using sudo on some systems, or vim will give the default/root user settings
"eg sudo -E vim filename
"
"
"to reload this file after editing it use :source %
"or for short :so %
"
"
" use these for profiling how vim uses resources
"profile start ~/Documents/profile.log
"profile func *
"profile file *
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""" General settings
set encoding=utf-8
" be vim, don't pretend to be vi
set nocompatible
"set backspace=indent,eol,start
"set ruler
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
set ignorecase
set smartcase
"set spell
set linebreak
set backupdir=~/.vim/backup//
set dir=~/.vim/swap//
set undodir=~/.vim/undo//
set nofoldenable
set hidden
set cmdheight=2
set updatetime=300
" set font for firenvim browser extension
set guifont=courier:h14
" my terminal emulator (konsole) overrules
" vims ctrl-v command, to use it for paste,
" and I like it like that
" so map vv to enter visual block mode
nnoremap vv <C-v>
" and in firenvim it doesn't do that,
" so remap it so it does
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+pa
" and Ctrl C to copy
vnoremap <C-c> "+y
" leave COC to handle LSP
" this must come before plugins are loaded
"let g:ale_disable_lsp = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""  Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install vim-plug if it isn't already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
			\| PlugInstall --sync | source $MYVIMRC
			\| endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" declare plugins for vim-plug to install
""" :PlugInstall will install them
""" also :PlugClean and :PlugUpdate
""" are useful
call plug#begin()
"""""""""""""""""""""""
" This will include the help
" files for vim-plug itself
Plug 'junegunn/vim-plug'
""""""""""""""""""""""
""""""" Git stuff
" git automation
Plug 'tpope/vim-fugitive'
" github support
Plug 'tpope/vim-rhubarb'
" bitbucket support
Plug 'tommcdo/vim-fubitive'
" branch viewer for git
Plug 'sodapopcan/vim-twiggy'
" Plug 'idanarye/vim-merginal'
" git commit browser
Plug 'junegunn/gv.vim'
" view git changes
"Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
"""""""""""""""""""""""""""
" nerdtree filesystem viewer
"Plug 'preservim/nerdtree'
""""""
" Fern filesystem viewer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'lambdalisue/fern-bookmark.vim'
" info at bottom of buffer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" syntax error highlighting
Plug 'scrooloose/syntastic'
"automatic ctags generation
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'
"""""""""""""" LSP stuff
"Plug 'prabirshrestha/vim-lsp'
" sets up LSP servers to use
"Plug 'mattn/vim-lsp-settings'
" autocomplete
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
" LSP completion sources
"Plug 'andreypopp/asyncomplete-ale.vim'
"Plug 'htlsne/asyncomplete-look'
"Plug 'kitagry/asyncomplete-tabnine.vim', { 'do': './install.sh' }
" asynchronous lint engine
"Plug 'dense-analysis/ale'
"""" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
"""" Already have tabnine as a source for asyncomplete
"""" but this is the official plugin so I might try it instead
"Plug 'codota/tabnine-vim'
""""tagbar to navigate tags
Plug 'preservim/tagbar'
"also shows tags but I find tagbar works
"better for ctags
"and vista shows TOC for markdown
"and LSP tags
Plug 'liuchengxu/vista.vim'
"automatic closing of quotes, parentheses etc
Plug 'Raimondi/delimitMate'
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
"Plug 'lilydjwg/colorizer'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
"syntax highlighting for many languages
Plug 'sheerun/vim-polyglot'
"Plug '2072/PHP-Indenting-for-VIm'
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
" peekaboo registers helpers
Plug 'junegunn/vim-peekaboo'
"Snippets - completion menu
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'sniphpets/sniphpets-common'
"fancy start screen
Plug 'mhinz/vim-startify'
Plug 'csch0/vim-startify-renderer-nerdfont'
"debugger
Plug 'vim-vdebug/vdebug'
"use nvim in browser text inputs
"with the chrome extension
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
""""""""""""""""""""""""""""""""""""""
"Colour schemes
"Plug 'rafi/awesome-vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jdsimcoe/abstract.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'rakr/vim-one'
Plug 'tomasiser/vim-code-dark'
Plug 'baskerville/bubblegum'
" Miamineon is my favourite colour scheme
" and it's not good at installing itself
function! Miamineon(x)
	let data_dir = has('nvim') ? '~/.config/nvim' : '~/.vim'
	execute '!mkdir '.data_dir.'/colors/'
	execute '!ln -s ' .data_dir.'/plugged/miamineon/miamineon.vim '.data_dir.'/colors/miamineon.vim'
	execute '!ln -s ' .data_dir.'/plugged/miamineon/miamineon-airline.vim '.data_dir.'/plugged/vim-airline-themes/autoload/airline/themes/miamineon.vim'
endfunction
Plug 'keelbeelveel/miamineon', { 'do': function('Miamineon')}
Plug 'nanotech/jellybeans.vim'
Plug 'ethantrithon/elementary.vim'
Plug 'mrkn/mrkn256.vim'
""""""""""""""""""""""""""""""""""""""""
" All plugins must be added before the following line
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"disable plugin maps that slow down my own
"let g:gitgutter_map_keys=0
filetype on
filetype plugin indent on
filetype plugin on
set smartindent
runtime macros/matchit.vim
"required for RRethy/vim-hexokinase
set termguicolors
set t_Co=256
"Set the colorscheme
colorscheme miamineon
"colorscheme tokyonight
set background=dark
"set leader as space
let mapleader = " "
" open help windows in vertical split
" on the left by default
autocmd FileType help wincmd H
autocmd FileType markdown set conceallevel=3
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"----- startify settings ----
let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'lcd'
let g:startify_fortune_use_unicode = 1
" custom commands
let g:startify_commands = [
			\ {'s': ['Simplenote', 'SN']},
			\ {'#': ['Bookmarks', 'Fern bookmark:///']},
			\ {'c': ['Cheatsheet', 'CS']},
			\ ]
""\ ':help reference',
""\ {'h': 'h ref'},
" custom ascii art start screen
let g:ascii = [
			\" _____                              _      __      ___",
			\"|  __ \\                            ( )     \\ \\    / (_)",
			\"| |  | |_   _ _ __   ___ __ _ _ __ |/ ___   \\ \\  / / _ _ __ ___",
			\"| |  | | | | | '_ \\ / __/ _` | '_ \\  / __|   \\ \\/ / | | '_ ` _ \\ ",
			\"| |__| | |_| | | | | (_| (_| | | | | \\__ \\    \\  /  | | | | | | |",
			\"|_____/ \\__,_|_| |_|\\___\\__,_|_| |_| |___/     \\/   |_|_| |_| |_|",
			\""
			\]
let g:startify_custom_header =
			\ 'startify#pad(g:ascii + startify#fortune#boxed())'
" custom menus
let g:startify_lists = [
			\ { 'header': ['   MRU'],            'type': 'files' },
			"\ { 'header': ['   MRU '. getcwd()], 'type': 'dir' },
			\ { 'header': ['   Commands'],       'type': 'commands' },
			\ ]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"------ fern settings -----
"let g:fern#default_exclude = '\tags'
let g:fern#renderer = "nerdfont"
"let g:fern#disable_default_mappings = 1
"toggle fern with <leader> f
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -toggle -width=40 <CR><C-w>=
nnoremap <leader># :Fern bookmark:///<CR>
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
	nmap <buffer> <C-t> <Plug>(fern-action-open:tabedit)
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" FZF
"""""""""""
" open in splits and new tabs with Ctrl t/o/e
" Tab/hOrizontal/vErtical
let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-o': 'split',
			\ 'ctrl-e': 'vsplit'
			\ }
command! -bang -nargs=* GGrep
			\ call fzf#vim#grep(
			\   'git grep --line-number -- '.shellescape(<q-args>), 0,
			\   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
" search file names
nnoremap  <leader>s :Files<CR>
" search inside files
nnoremap <Leader>i :RG<CR>
" search buffers
nnoremap <Leader>b :Buffers<CR>
" search in current buffer
nnoremap  <Leader>/ :BLines<CR>
" search help
nnoremap  <Leader>h :Helptags<CR>
" history of Recently opened files
nnoremap  <Leader>r :History<CR>
" search for my own mapped commands
nnoremap  <Leader>m :Maps<CR>^<space<space>init.vim<space>
" search for tags in the current buffer
" `:Vista finder` also does a similar thing
" but it doesn't seem to play well with coc
" so I might change this map back to `:Vista finder`
" if it is better in future
nnoremap  <Leader>t :BTags<CR>
" use ripgrep instead of grep by default in vim
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
"""""""""""""""""
" make :Rg only search for file contents, not file names as well
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
""""""""""""""""""
""""better ripgrep integration, call RG instead of Rg
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""2
"""" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'sharp'} }
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""  Vista.vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :Vista!!<CR>
"nnoremap <leader>t :Vista finder<CR>
let g:vista_fzf_preview = ['right:50%']
let g:vista_keep_fzf_colors = 1
let g:vista_default_executive = 'coc'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" lsp-vim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>l :LspHover<CR>
"highlight lspReference ctermfg=red guifg=red ctermbg=green guibg=green
"let g:lsp_diagnostics_echo_cursor = 1
"let g:lsp_diagnostics_float_cursor = 1
"move focus to preview window
let g:lsp_preview_keep_focus = 0
"let g:lsp_hover_conceal = 0
let g:lsp_semantic_enabled = 1
highlight link lspReference Underlined
"highlight link LspErrorHighlight Error
"highlight link LspWarningHighlight Error
"highlight link LspInformationHighlight Error
"highlight link LspHintHighlight Error
highlight link LspErrorVirtualText Error
highlight link LspWarningVirtualText Error
highlight link LspInformationVirtualText Error
highlight link LspHintVirtualText Error
"""LSP delays
""defaults to 80
let g:lsp_completion_documentation_delay = 0
"""all these default to 500
let g:lsp_diagnostics_echo_delay = 0
let g:lsp_diagnostics_float_delay = 0
let g:lsp_diagnostics_highlights_delay = 0
let g:lsp_diagnostics_signs_delay = 0
let g:lsp_diagnostics_virtual_text_delay = 0
let g:lsp_document_code_action_signs_delay = 0
"defaults to 350
let g:lsp_document_highlight_delay = 0
"defaults to 200
let g:lsp_signature_help_delay = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" gutentags
"set statusline+=%{gutentags#statusline()}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" status bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusbar
set laststatus=2
" -- INSERT -- etcetera is shown by airline
" so don't need to show it in the command line
set noshowmode
let g:airline_theme = 'miamineon'
" Show PASTE if in paste mode
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#fern#enabled = 1
let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = '🚫'
let airline#extensions#coc#warning_symbol = '⚠️'
"if !exists('g:airline_symbols')
"let g:airline_symbols = {}
"endif
"if !exists('g:airline_powerline_fonts')
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_left_sep          = '▶'
"let g:airline_left_alt_sep      = '»'
"let g:airline_right_sep         = '◀'
"let g:airline_right_alt_sep     = '«'
"let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
"let g:airline#extensions#readonly#symbol   = '⊘'
"let g:airline#extensions#linecolumn#prefix = '¶'
"let g:airline#extensions#paste#symbol      = 'ρ'
"let g:airline_symbols.linenr    = '␊'
"let g:airline_symbols.branch    = '⎇'
"let g:airline_symbols.paste     = 'ρ'
"let g:airline_symbols.paste     = 'Þ'
"let g:airline_symbols.paste     = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"else
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
"" powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" tab bar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
"show tab number, not number of splits in tab
let g:airline#extensions#tabline#tab_nr_type = 1
"only show tabline if there is more than one tab
let g:airline#extensions#tabline#tab_min_count = 2
"set showtabline=1
" expose maps to jump to tabs
let g:airline#extensions#tabline#buffer_idx_mode = 1
" set those maps
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" simplenote settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load my username and password
" by loading a securely stored
" file that sets these two variables
" let g:SimplenoteUsername = "USERNAME"
" let g:SimplenotePassword = "PASSWORD"
:source ~/Documents/me/security/simplenote.txt
" set some simplenote preferences
"let g:SimplenoteSingleWindow=1
let g:SimplenoteVertical=1
let g:SimplenoteListSize=70
let g:SimplenoteFiletype="markdown"
" set the display format for note titles
let g:SimplenoteNoteFormat="%F%-40N%>[%T][%D]"
" set the time and date display format
let g:SimplenoteStrftime="%d-%m-%y %H:%M:%S"
""""""""""""""""""""""""""""""""""""""""""
" open Simplenote in a new tab or go to
" the tab if it's already open
" take arguments to use as search terms
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
"""""""""""""""""""""""""""""""""""""""""""
" new note
" open simplenote in a new tab
" or go to tab it's already in
" make a new note
cnoreabbrev SNN call SimplenoteNew()
function! SimplenoteNew()
	let s:winids = win_findbuf(bufnr('Simplenote'))
	if len(s:winids) > 0
		call win_gotoid(s:winids[0])
		SimplenoteList
		vnew
		SimplenoteNew
	else
		tabnew
		SimplenoteList
		vnew
		SimplenoteNew
	endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""
" shortcut to edit a note's tags
cnoreabbrev SNT SimplenoteTag
"""""""""""""""""""""""""""""""""""""
" this didn't work well and I don't really
" want it anyway
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" scrooloose/syntastic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""" preservim/tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Open/close tagbar with <leader>a
nmap <leader>a :TagbarToggle<CR>
let g:tagbar_map_togglefold = "z"
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""" Raimondi/delimitMate settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""prabirshrestha/asyncomplete.vim
" use tab to choose completio
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
"" register sources
"au User asyncomplete_setup call asyncomplete#register_source({
""\ 'name': 'look',
""\ 'allowlist': ['text', 'markdown'],
""\ 'completor': function('asyncomplete#sources#look#completor'),
""\ })
"call asyncomplete#register_source(asyncomplete#sources#tabnine#get_source_options({
""\ 'name': 'tabnine',
""\ 'allowlist': ['*'],
""\ 'completor': function('asyncomplete#sources#tabnine#completor'),
""\ 'config': {
""\   'line_limit': 1000,
""\   'max_num_result': 20,
""\  },
""\ }))
"au User asyncomplete_setup call asyncomplete#ale#register_source({
""\ 'name': 'reason',
""\ 'linter': 'flow',
""\ })
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""     Coc-nvim
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
" default mappings because coc-fzf uses them
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
" maps I prefer
nnoremap ch <Plug>(coc-definition)
nnoremap cj <Plug>(coc-type-definition)
nnoremap ck <Plug>(coc-implementation)
nnoremap cl <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" Symbol renaming.
"nnoremap <leader>rn <Plug>(coc-rename)
""""" coc-fzf
nnoremap <leader>c <C-u>:CocFzfList<CR>
vnoremap <leader>c <C-u>:CocFzfList<CR>
let g:coc_fzf_preview = 'right:50%'
let g:coc_fzf_opts = []
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" emojis
" Use emoji-fzf and fzf to fuzzy-search for emoji, and insert the result
"
"
function! InsertEmoji(emoji)
	let @a = system("awk '{ print \$1 }'", a:emoji)
	normal! "apkgJ
endfunction
command! -bang Emoj
			\ call fzf#run({
			\ 'source': 'emoji-fzf preview --prepend',
			\ 'sink': function('InsertEmoji')
			\ })
" Ctrl-e in normal and insert mode will open the emoji picker.
" Unfortunately doesn't bring you back to insert mode 😕
map <C-e> :Emoj<CR>
imap <C-e> <C-o><C-e>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" this deletes blank lines
"" and blank trailing characters
"" and indents stuff
"" and formats it with LSP
"" if it's available
fun! DelBlank()
	%s/\s\+$//e
	%s/\n\{2,}/\r/e
	normal gg=G
	"LspDocumentFormat
	call CocAction('format')
	normal `a
endfun
nnoremap <leader>= ma:call DelBlank()<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""line numbering
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
nnoremap <leader>n :call NumberToggle()<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! CS call CheatSheet()
fun! CheatSheet()
	let s:winids = win_findbuf(bufnr('cheatsheet.md'))
	if len(s:winids) > 0
		call win_gotoid(s:winids[0])
		"execute 'SimplenoteList' s:tags
	else
		tabnew
		e ~/vim/cheatsheet.md
		"execute 'SimplenoteList' s:tags
	endif
	"tab drop ~/vim/cheatsheet.md
	Vista
endfun
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"my diff function for two already open tabs
fun! Diff(x, y)
	execute 'tab sb' a:x
	execute 'diffthis'
	execute 'vert sb' a:y
	execute 'diffthis'
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Shortcuts for git
nnoremap <leader>g :vertical Git<CR>:Twiggy<CR>
nnoremap <leader>d :Gvdiff<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"navigate windows more easily
nnoremap <tab>h <C-w>h
nnoremap <tab>j <C-w>j
nnoremap <tab>k <C-w>k
nnoremap <tab>l <C-w>l
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" folding
"toggle current fold
nnoremap <leader>z za
"open all folds
nnoremap <leader>Z zR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"my preferred diff colors
"it seems like a lot of color schemes
"either look horrible in diff, or don't
"have syntax highlighting
"these colours work well with the miamineon
"colorscheme that I like
highlight DiffAdd ctermfg=NONE ctermbg=022 guifg=NONE guibg=022
highlight DiffChange ctermfg=NONE ctermbg=000 guifg=NONE guibg=000
highlight DiffDelete ctermfg=196 ctermbg=NONE guifg=196 guibg=NONE
highlight DiffText ctermfg=NONE ctermbg=022 guifg=NONE guibg=022
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"This is called after all the plugins and
"settings in this vimrc file are loaded
"it is called by the after.vim file
function! After()
	"I'm not actually using this function anymore
	"but I'm leaving it here in case I want
	"to load something after plugins
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is a first time setup function
" to install/configure LSP servers
" and dependencies etcetera.
cnoreabbrev setup call Setup()
function! Setup()
	CocInstall coc-json coc-sh coc-css coc-html
				\ coc-tsserver coc-markdownlint coc-phpls coc-pyright
				\ coc-git
	"CocConfig
	"norm o{"diagnostic.displayByAle": true,}
	"w
	"bd
	"Startify
endfunction
" jobs not done by this
" manually set up xdebug
" manually install LSP server connections
" by using :LspInstallServer when
" editing a file with a
" supported filetype
" manually install coc server
" eg  :CocInstall coc-phpls
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
