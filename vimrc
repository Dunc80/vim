" using the .vimrc file in your home folder will require -E
" when using sudo on some systems, or vim will give the default/root user settings
" eg sudo -E vim filename
"
" to reload this file after editing it use :source %
" or for short :so %
" or :w | so %
" to save and load

" use these for profiling how vim uses resources
" profile start ~/Documents/profile.log
" profile func *
" profile file *

" navigate this file with folding
" `zm` to close all folds by one level
" `l` open current fold

" General settings {{{

set encoding=utf-8
" scriptencoding utf-8
" set fileencoding=utf-8
" this makes vim be vim
" instead of pretending to be vi
set nocompatible
"set backspace=indent,eol,start
"set ruler
set showcmd
set incsearch
set hlsearch
syntax on
set mouse=a
"set tabstop=2
"set shiftwidth=2
set autoindent
set smartindent
" start scrolling the text when
" the cursor is 10 lines
" from the top or bottom of the screen
set scrolloff=10
"let php_sql_query = 1
"let php_htmlInStrings = 1
" set list of characters to represent blank characters
set listchars=tab:\ \ ⇥,nbsp:␣,trail:·,extends:→,precedes:←,eol:¶
" switch on hidden characters
" or leave this commented to leave them hidden
"set list
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
" }}}
" Vim-Plug {{{

" Install vim-plug if it isn't already
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif
" declare plugins for vim-plug to install
" :PlugInstall will install them
" also :PlugClean and :PlugUpdate
" are useful
call plug#begin()
" This will include the help
" files for vim-plug itself
Plug 'junegunn/vim-plug'
" Git stuff
" git automation
Plug 'tpope/vim-fugitive'
" github support
Plug 'tpope/vim-rhubarb'
" bitbucket support
"Plug 'tommcdo/vim-fubitive'
" branch viewer for git
Plug 'sodapopcan/vim-twiggy'
" Plug 'idanarye/vim-merginal'
" git commit browser
Plug 'junegunn/gv.vim'
" view git changes
"Plug 'mhinz/vim-signify'
"Plug 'airblade/vim-gitgutter'
" nerdtree filesystem viewer
"Plug 'preservim/nerdtree'

" show guidelines for indented text
Plug 'nathanaelkane/vim-indent-guides'

" Tags and surrounds () "" [] etc
Plug 'tpope/vim-surround'

" allows plugin commands to repeat with `.`
Plug 'tpope/vim-repeat'

" comment out blocks with `gcc`
" for a line
" or e.g. 'gcap` comment around paragraph
Plug 'tpope/vim-commentary'

" handle saving state on exit
Plug 'tpope/vim-obsession'

" define more text objects to work on
" e.g`vii`, `vil` visually select indent or line
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'

" Drag visual blocks
"Plug 'zirrostig/vim-schlepp'
"schlepp doesn't work with nvim
Plug 'matze/vim-move'

" In block selection mode
" using `:'<,'>` will make vim
" operate on whole lines
" this plugin make `:'<,'>B` only
" operate on the selected block
Plug 'vim-scripts/vis'

" Fern filesystem viewer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
"Plug 'lambdalisue/fern-hijack.vim'
" a preview window for fern, but it doesn;t work in nvim
Plug 'yuki-yano/fern-preview.vim'
"Plug 'kat0h/fern-preview.vim'

" this optimises certain plugins in nvim
Plug 'antoinemadec/FixCursorHold.nvim'

" info at bottom of buffer
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" syntax error highlighting
" I'm going to remove this because
" I think COC is doing it as well
" Plug 'scrooloose/syntastic'

"automatic ctags generation
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'

""" LSP stuff
" not using this now because using
" COC instead
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

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" Already have tabnine as a source for asyncomplete
" but this is the official plugin so I might try it instead
" actually not using it, it works better through coc
"Plug 'codota/tabnine-vim'

"tagbar to navigate tags
Plug 'preservim/tagbar'

" also shows tags but I find tagbar works
" better for ctags
" and vista shows TOC for markdown
" and LSP tags
Plug 'liuchengxu/vista.vim'

" automatic closing of quotes, parentheses etc
Plug 'Raimondi/delimitMate'

" autocloses html tags
Plug 'vim-scripts/HTML-AutoCloseTag'

" FZF fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'LumaKernel/fern-mapping-fzf.vim'

" shows colors of hex codes
"Plug 'lilydjwg/colorizer'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" syntax highlighting for many languages
Plug 'sheerun/vim-polyglot'

" this is for reading GPG encrypted files
Plug 'jamessan/vim-gnupg'

" track vim usage in wakatime
Plug 'wakatime/vim-wakatime'

" edit subtitles files
Plug 'ggandor/vim-srt-sync'

" these two work together to display markdown files
" with folding and toc
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" VimWiki
Plug 'vimwiki/vimwiki'

" peekaboo registers helpers
Plug 'junegunn/vim-peekaboo'

" fancy start screen
Plug 'mhinz/vim-startify'
Plug 'csch0/vim-startify-renderer-nerdfont'

" debugger
Plug 'vim-vdebug/vdebug'

" use nvim in browser text inputs
" with the chrome extension
if has('nvim')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

""" Colour schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'ghifarit53/tokyonight-vim'
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
Plug 'sickill/vim-monokai'

" tab naming
Plug 'gcmt/taboo.vim'

" All plugins must be added before the following line
call plug#end()
" }}}
" More Settings {{{

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
"set term=xterm-256color
"Set the colorscheme
colorscheme challenger_deep
"colorscheme miamineon
"colorscheme tokyonight
set background=dark
"set leader as space
let mapleader = " "

" open help windows in vertical split
" on the left by default
" autocmd FileType help wincmd H

autocmd FileType markdown set conceallevel=3
set foldmethod=marker
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'tagbar', 'vista', 'vista_markdown']

" antoinemadec/FixCursorHold.nvim setting
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

nnoremap <leader><Up> <C-w>+<C-w>+<C-w>+<C-w>+<C-w>+
nnoremap <leader><Down> <C-w>-<C-w>-<C-w>-<C-w>-<C-w>-
nnoremap <leader><Left> <C-w><<C-w><<C-w><<C-w><<C-w><
nnoremap <leader><Right> <C-w>><C-w>><C-w>><C-w>><C-w>>

nnoremap <leader>- :set list!<CR>

" map backspace to go back to last buffer
nnoremap <bs> <C-^>
" allow the cursor to be in positions where there is no character
set virtualedit=insert
"vmap <unique> <up>    <Plug>SchleppUp
"vmap <unique> <down>  <Plug>SchleppDown
"vmap <unique> <left>  <Plug>SchleppLeft
"vmap <unique> <right> <Plug>SchleppRight
"vmap <unique> D <Plug>SchleppDup
" }}}
" Startify {{{
let g:startify_change_to_vcs_root = 1
let g:startify_change_cmd = 'lcd'
let g:startify_fortune_use_unicode = 1
" custom commands
"   let g:startify_commands = [
"   "\ {'s': ['VimWiki', '<leader>w']},
"   "\ {'#': ['Bookmarks', 'Fern bookmark:///']},
"   "\ {'c': ['Cheatsheet', 'CS']},
"   "\ ]
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
            \ { 'header': ['   Commands'],       'type': 'commands' },
            \ ]
" }}}
" Fern {{{
"let g:fern#default_exclude = '\tags'
let g:fern#renderer = "nerdfont"
"let g:fern#disable_default_mappings = 1
"toggle fern with <leader> f
noremap <Leader>f :Fern . -drawer -width=30 -reveal=% -toggle <CR>
""<C-w>=
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
    ""nmap <buffer> p     <Plug>(fern-action-preview:toggle)
    ""nmap <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    ""nmap <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    ""nmap <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
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

function! s:fern_settings() abort
    nmap <silent> <buffer> <expr> <Plug>(fern-quit-or-close-preview) fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")
    nmap <silent> <buffer> q <Plug>(fern-quit-or-close-preview)
endfunction
""
"make fern preview window 50% width
"if !has('nvim')
"function! fern_preview#width_default_func() abort
"let width = float2nr(&columns * 0.5)
"return width
"endfunction
"endif

function! s:fern_settings() abort
    nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
    nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
    nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
    nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
    autocmd!
    autocmd FileType fern call s:fern_settings()
augroup END

" }}}
" FZF {{{

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
nnoremap  <Leader>m :Maps<CR>^<space
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

" map leader o to view outline, aka ctags in a fzf window
nnoremap <leader>o :<C-u>CocFzfList outline<CR>
" }}}
" Vista.vim {{{
nnoremap <leader>v :Vista!!<CR>
"nnoremap <leader>t :Vista finder<CR>
let g:vista_fzf_preview = ['right:50%']
let g:vista_keep_fzf_colors = 1
let g:vista_default_executive = 'coc'
let g:vista_vimwiki_executive = 'markdown'

" }}}
" lsp-vim {{{
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
"" }}}
" Gutentags {{{
"set statusline+=%{gutentags#statusline()}
"" }}}
" Status Bar {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show statusbar
set laststatus=2
" -- INSERT -- etcetera is shown by airline
" so don't need to show it in the command line
set noshowmode
" better not to set this, airline finds
" the colorscheme anyway, but doesn't
" change if you switch colorschemes when it
" is set explicitly here
" let g:airline_theme = 'miamineon'
" Show PASTE if in paste mode
let g:airline_detect_paste=1
let g:airline_detect_crypt=1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#fern#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#fugitive#enabled = 1
let airline#extensions#coc#error_symbol = '🚫'
let airline#extensions#coc#warning_symbol = '⚠️'
let g:airline#extensions#gutentags#enabled = 1
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"endif
"" }}}
" Tab Bar {{{
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
" }}}
" Vim Wiki {{{
let g:vimwiki_list = [{'path': '~/Notes/',
            \ 'syntax': 'markdown', 'auto_toc' : 1,
            \ 'index': '!Index',
            \ 'ext': '.md'}]

"let g:vimwiki_table_mappings = 0
let g:vimwiki_key_mappings = { 'headers': 0,
            \ 'table_mappings': 0,
            \ 'global': 0}
"nnoremap <buffer> <CR> <Plug>VimwikiFollowLink
"nnoremap <buffer> <C-o> <Plug>VimwikiSplitLink
"nnoremap <buffer> <C-e> <Plug>VimwikiVSplitLink
" nnoremap <buffer> <C-t> <Plug>VimwikiTabnewLink
"nnoremap <buffer> <leader><Backspace> <Plug>VimwikiGoBackLink

nnoremap <leader>w :VimwikiTabIndex<CR>:tcd %:p:h<CR>:TabooRename Vimwiki Notes<CR>

""command! -nargs=1 N call NewNote(<args>)
""function NewNote()
""
""endfunction
" }}}
" Preservim/tagbar settings {{{

"Open/close tagbar with <leader>a
nmap <leader>a :TagbarToggle<CR>

" toggle fold in tagbar with `z`
let g:tagbar_map_togglefold = "z"
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" }}}
" Raimondi/delimitMate settings {{{

"let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
" }}}
" Coc-nvim {{{
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    "set signcolumn=number
    " but I don't like it, so:
    set signcolumn=yes
else
    set signcolumn=yes
endif

"make <TAB> operate the autocomplete
inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<tab>"

" prevent conflict with keymapping in vimwiki
au filetype vimwiki silent! iunmap <buffer> <Tab>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

" GoTo code navigation.
" default mappings because coc-fzf uses them
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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
" let coc treat vimwiki files as md
let g:coc_filetype_map = {
            \ 'vimwiki': 'markdown',
            \ }
" }}}
" Emojis {{{
" Use emoji-fzf and fzf to fuzzy-search for emoji, and insert the result
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
" }}}
" Formatting {{{
"" this deletes blank lines
"" and blank trailing characters
"" and indents stuff
"" and formats it with LSP
"" if it's available
fun! MyFormat()
    ""	normal e
    ""	normal ma
    "remove non-breaking space characters
    %s/\%ua0/ /e
    "remove zero width space characters
    %s/\%u200B//e
    "remove trailing whitespace
    %s/\s\+$//e
    "remove carriage return characters
    %s/\n/\r/e
    ""%s/\r/\r/e
    ""%s//\r/e
    "remove multiple consecutive blank lines
    %s/\n\{3,}/\r\r/e
    "indent entire document
    normal gg=G
    "LspDocumentFormat
    silent! call CocAction('format')
    normal ``0zz
endfun
nnoremap <leader>= :call MyFormat()<cr>
" }}}
" Line Numbering {{{
" switch on line numbering
" this is on so that toggling relative line numbering leaves
" normal line numbering instead of removing it completely
set nu
" switch on relative line numbering
" this leaves absolute line numbering on for the current line
set rnu
" function to toggle the relative line numbering
fun! NumberToggle()
    set rnu!
endfunc
nnoremap <leader>n :call NumberToggle()<cr>
" }}}
"my diff function for two already open tabs {{{
fun! Diff(x, y)
    execute 'tab sb' a:x
    execute 'diffthis'
    execute 'vert sb' a:y
    execute 'diffthis'
endfunc
" }}}

"trying to highlight and indent files with
"both html and php better
"augroup filetypedetect
""	au BufRead,BufNewFile *.php
""	if search('div')>0 |
""		set ft=phtml.html |
""	endif
" augroup END

" Shortcuts/Remaps {{{
"Shortcuts for git

" open fugitive and twiggy to show git status
"nnoremap <leader>g :vertical Git<CR>:Twiggy<CR>
" open git actions in FZF window
nnoremap <leader>g :CocCommand fzf-preview.GitActions<CR>
nnoremap <leader>d :Gvdiff<CR>:windo set foldmethod=manual<CR>

"navigate windows more easily
nnoremap <tab>h <C-w>h
nnoremap <tab>j <C-w>j
nnoremap <tab>k <C-w>k
nnoremap <tab>l <C-w>l
" }}}
" Diff colors {{{
" my preferred diff colors
" it seems like a lot of color schemes
" either look horrible in diff, or don't
" have syntax highlighting
" these colours work well with the miamineon
" colorscheme that I like
" and challenger deep and most dark colour schemes
function! Colors()
    highlight DiffAdd ctermfg=NONE ctermbg=022 guifg=NONE guibg=#005f00
    highlight DiffChange ctermfg=NONE ctermbg=000 guifg=NONE guibg=#000000
    highlight DiffDelete ctermfg=196 ctermbg=NONE guifg=#ff0000 guibg=NONE
    highlight DiffText ctermfg=NONE ctermbg=022 guifg=NONE guibg=#005f00
    hi ColorColumn ctermbg=250 guibg=#ff8655
endfunction

" }}}
" After {{{
"This is called after all the plugins and
"settings in this vimrc file are loaded
"it is called by the after.vim file
function! After()
    call Colors()
    "disable plugin maps that slow down my own
    unmap <Leader>swp
    unmap <Leader>rwp
endfunction
" }}}
" Setup {{{
" This is a first time setup function
" to install/configure LSP servers
" and dependencies etcetera.
cnoreabbrev setup call Setup()
function! Setup()
    CocInstall coc-json coc-sh coc-css coc-html
                \ coc-tsserver coc-markdownlint coc-phpls coc-pyright
                \ coc-git coc-vimlsp coc-fzf-preview
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
" }}}
" vim:fdm=marker

cnoreabbrev htm call HtmlToMarkdown()
function! HtmlToMarkdown()
    " -------------------
    " Generic markdownify
    " -------------------

    " Put every tag to new line
    %s/></>\r</g
    " Separate paragraphs by one line
    %s/<br \/>\n*<br \/>/\r\r/
    %s/\n\n\{2,}/\r\r/
    " Markdownify links
    %s/<a href="https\?:\(.\{-}\)">\(.\{-}\)<\/a>/[\2](\1)/g
    " Markdownify bold, cursiva & strikethrough
    %s/<i>\(.\{-}\)<\/i>/_\1_/g
    %s/<b>\(.\{-}\)<\/b>/**\1**/g
    %s/<strike>\(.\{-}\)<\/strike>/\~\~\1\~\~/g
    " Markdownify headers
    %s/<h2.\{-}>\(.\{-}\)<\/h2>/## \1\r\r/g
    %s/<h3.\{-}>\(.\{-}\)<\/h3>/### \1\r\r/g
    %s/<h4.\{-}>\(.\{-}\)<\/h4>/#### \1\r\r/g
    " Markdownify monospace
    %s/<span.\{-}monospace.\{-}>\(.\{-}\)<\/span>/`\1`/g
    " Markdownify items
    %s/<li>\n\?\(.\{-}\)\n\?<\/li>/* \1/
    " Replace a non-breaking-space with a space
    %s/&nbsp;/ /g
    " Markdownify dashes
    %s/ - / --- /g
    " Markdownify blockquotes
    %s/<blockquote.\{-}>\n\?\(.\+\)\n\?<\/blockquote>/> \1\r\r/g

    " -------------------------
    " External sites shortcodes
    " -------------------------

    " Markdownify gists
    %s/<script .\{-}\(gist\)\.github\.com\/\(.\{-}\)\/\(.\{-}\)\.js">\n\?<\/script>\s*\(<br \/>\)\?/{{< \1 \2 \3 >}}\r\r/g

    " ---------------------------
    " sw-samuraj.cz & clojure.cz specific changes
    " ---------------------------

    " Remove following prefix from links, plus .html suffix:
    " * //sw-samuraj.cz
    " * //www.sw-samuraj.cz
    " * http://sw-samuraj.cz
    " * https://sw-samuraj.cz
    " * http://www.sw-samuraj.cz
    " * https://www.sw-samuraj.cz
    %s/(\(https\?:\)\?\/\/\(w\{3}\.\)\?sw-samuraj\.cz\(\/.\{-}\)\.html)/(\3\/)/cg
    " Remove following prefix from links, plus .html suffix:
    " * //clojure.cz
    " * //www.clojure.cz
    " * http://clojure.cz
    " * https://clojure.cz
    " * http://www.clojure.cz
    " * https://www.clojure.cz
    %s/(\(https\?:\)\?\/\/\(w\{3}\.\)\?clojure\.cz\(\/.\{-}\)\.html)/(\3\/)/cg
endfunction

