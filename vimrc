" using the .vimrc file in your home folder will require -E
" when using sudo on some systems, or vim will give the default/root user settings
" eg sudo -E nvim filename
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
" `zM` to close all folds by one level
" `za` toggle current fold
"
" TODO: tidy all code
"   remove code that is commented out
"   make sections tidier
"   remove unused code
"   remove code that is not needed
" TODO: git commit
"   stage all changes
"   commit
" TODO: merge to master branch
"   start release branch
"   finish release branch
"   push
"   pull to vps
"   pull to pi

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

" github co-pilot
Plug 'github/copilot.vim'

" Git stuff
Plug 'tpope/vim-fugitive'
" github support
Plug 'tpope/vim-rhubarb'
" bitbucket support
Plug 'tommcdo/vim-fubitive'
" use gitsigns so statusline can get git info
Plug 'lewis6991/gitsigns.nvim'

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
Plug 'matze/vim-move'

" In block selection mode
" using `:'<,'>` will make vim
" operate on whole lines
" this plugin make `:'<,'>B` only
" operate on the selected block
" Plug 'vim-scripts/vis'

" Fern filesystem viewer
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-git-status.vim'
"Plug 'lambdalisue/fern-hijack.vim'
" a preview window for fern
Plug 'yuki-yano/fern-preview.vim'
"Plug 'kat0h/fern-preview.vim'

" this optimises certain plugins in nvim
Plug 'antoinemadec/FixCursorHold.nvim'

"automatic ctags generation
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'
Plug 'universal-ctags/ctags'
Plug 'ludovicchabant/vim-gutentags'

" Conquerer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'

" read and write files with sudo
Plug 'lambdalisue/suda.vim'

"tagbar to navigate tags
Plug 'preservim/tagbar'

" also shows tags but I find tagbar works
" better for ctags
" and vista shows TOC for markdown
" and LSP tags
Plug 'liuchengxu/vista.vim'

" autocloses html tags
Plug 'vim-scripts/HTML-AutoCloseTag'

" FZF fuzzy file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" use for openeing quickfix and location list in FZF
Plug 'ibhagwan/fzf-lua'

" telescope fuzzy search
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'BurntSushi/ripgrep'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'olacin/telescope-gitmoji.nvim'

" shows colors of hex codes
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" syntax highlighting for many languages
" Plug 'sheerun/vim-polyglot'

" this is for reading GPG encrypted files
Plug 'jamessan/vim-gnupg'

" track vim usage in wakatime
Plug 'wakatime/vim-wakatime'

" edit subtitles files
Plug 'ggandor/vim-srt-sync'

" VimWiki
Plug 'vimwiki/vimwiki'

" these two work together to display markdown files
" with folding and toc
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

" shows the content of registers when pressing " or @
Plug 'junegunn/vim-peekaboo'

" fancy start screen
Plug 'mhinz/vim-startify'
Plug 'csch0/vim-startify-renderer-nerdfont'

" debugger
Plug 'vim-vdebug/vdebug'

" TODOs in quickfix list
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim', { 'branch': 'neovim-pre-0.8.0' }

" smooth scrolling
Plug 'karb94/neoscroll.nvim'

" use nvim in browser text inputs
" with the chrome extension
if has('nvim')
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
endif

" pandoc integration
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

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

" lualine for statusline and tabline
Plug 'nvim-lualine/lualine.nvim'

" replaces and improves upon matchit.vim
" which is included with vim
Plug 'andymass/vim-matchup'

" All plugins must be added before the following line
call plug#end()
" }}}

" General settings {{{

set encoding=utf-8
" this makes vim be vim
" instead of pretending to be vi
set nocompatible
" do this before any other color settings
set termguicolors
colorscheme challenger_deep
set showcmd
set incsearch
set hlsearch
syntax on
set mouse=a
" set leader as space
let mapleader = " "
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent
" start scrolling the text when
" the cursor is 5 lines
" from the top or bottom of the screen
set scrolloff=5
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
set cmdheight=1
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
" }}}

" {{{ LuaLine config
lua << EOF

local function GetHiVal(name, layer)
  local fn = vim.fn
  return fn['synIDattr'](fn[('synIDtrans')](fn['hlID'](name)), layer .. '#')
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
      },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      }
    },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      {'branch',
        icon = '',
        -- colors are the highlight group for statusline
        color = {fg = GetHiVal('statusline', 'fg'),
        bg = GetHiVal('statusline', 'bg')},
      },
    {'diff',
      color = {
        bg = GetHiVal('signcolumn', 'bg')},
        symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    }, 
  {'diagnostics',
    color = {
      bg = GetHiVal('signcolumn', 'bg')},
      sources = { 'nvim_diagnostic', 'coc' },
      symbols = { error = ' ', warn = ' ', info = ' ' },
      },
    {
        function()
        -- count the number times the word 'TODO:' appears in the current buffer
        local todo = vim.fn.searchcount({pattern = 'TODO:', flags = 'c'})
        -- return the count if it's greater than 0
        return todo.total > 0 and ' ' .. todo.total or ''
        end,
        color = {
          bg = GetHiVal('signcolumn', 'bg'),
          fg = GetHiVal('diagnosticinfo', 'fg')
          },
  }
  },
lualine_c = {
  {'filename',
    path = 3,
    symbols = { modified = '', readonly = '' },
    -- show in red if modified
    color = function()
    if vim.bo.modified then
      return { fg = GetHiVal('errormsg', 'fg') }
      end
      end,
  },
  {
      'filesize',
  },
      {
          'searchcount',
            fmt = function()
            -- show the search symbol, search term, current match and total matches
            return ' \"' .. vim.fn.getreg('/') .. '\" ' .. vim.fn.searchcount().current .. '/' .. vim.fn.searchcount().total
            end,
        },
        {
            function() return '¶' end,
            color = function ()
            -- in white if hidden characters are on
            -- in grey if hidden characters are off
            if vim.wo.list then
              return { fg = GetHiVal('statusline', 'fg') }
            else
              return { fg = GetHiVal('statuslineNC', 'fg') }
              end
              end,
        },
        {
            -- display the fold method
            function()
            -- get the fold method from &l:fdm
            local fdm = vim.opt.foldmethod:get()
            --  local foldlevel = vim.opt.foldlevel:get()
            return ' ' .. fdm
            end,
        },
        {
            function() return '暈' end,
            color = function ()
            local spell = vim.opt.spell:get()
            if spell then
              return { fg = GetHiVal('statusline', 'fg') }
            else
              return { fg = GetHiVal('statuslineNC', 'fg') }
              end
              end,
              -- on_click only works in nvim >0.8
              --  on_click = function()
              --  -- toggle spell checking
              --  vim.opt.spell:toggle()
              --  end,
        },
        },
    lualine_x = {
      {

'v:this_session',



        }


      },
      lualine_y = {
        { 'encoding',
          color = {fg = GetHiVal('signcolumn', 'fg'),
          bg = GetHiVal('signcolumn', 'bg')},
        },
        {'fileformat',
          color = {fg = GetHiVal('signcolumn', 'fg'),
          bg = GetHiVal('signcolumn', 'bg')},
        },
        {'filetype',
          color = {fg = GetHiVal('signcolumn', 'fg'),
          bg = GetHiVal('signcolumn', 'bg')},
        },
      },
    lualine_z = {
      {
          'location',
          color = {fg = GetHiVal('signcolumn', 'fg'),
          bg = GetHiVal('signcolumn', 'bg')},
          fmt = function(location)
          -- show in the format of character line/total lines
          local current_line = vim.fn.line('.')
          local total_lines = vim.fn.line('$')
          local character = vim.fn.col('.')
          return string.format('%d:%d/%d', character, current_line, total_lines)
          end,
      },
    },
  },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
        },
    tabline = {
        lualine_a = {
            { 'tabs',
                mode = 2,
                -- max length is full width of screen
                max_length = function()
                return vim.fn.winwidth(0)
                end,
                fmt = function(name, context)
                -- Show + if buffer is modified in tab
                local buflist = vim.fn.tabpagebuflist(context.tabnr)
                local winnr = vim.fn.tabpagewinnr(context.tabnr)
                local bufnr = buflist[winnr]
                local mod = vim.fn.getbufvar(bufnr, '&mod')
                return name .. (mod == 1 and '  ' or ' ')
                end,
                tabs_color = 
                {
                        active = {
                            fg = GetHiVal('tabline', 'fg'),
                            bg = GetHiVal('tabline', 'bg'),
                            },
                        inactive = {
                            fg = GetHiVal('tablinesel', 'fg'), 
                            bg = GetHiVal('tablinesel', 'bg'),
                            },
                },
            },
        },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
        {
                -- show the total number of open buffers
                function()
                return ' ' .. vim.fn.len(vim.fn.getbufinfo({buflisted = 1}))
                end,
                -- set the color to the same as the statusline
                color = {fg = GetHiVal('statusline', 'fg'),
                bg = GetHiVal('statusline', 'bg')},
        },
    },
},

    winbar = {},
    inactive_winbar = {},
    extensions = {'fern', 'fugitive', 'fzf'}
}

EOF

" }}}

" {{{ setup more lua plugins

lua << EOF

-- needed to show the git status in the statusline
require('gitsigns').setup {
-- signs = {
--   add          = { text = '│' },
--   change       = { text = '│' },
--   delete       = { text = '_' },
--   topdelete    = { text = '‾' },
--   changedelete = { text = '~' },
--   untracked    = { text = '┆' },
-- },
  signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
-- attach_to_untracked = true,
-- current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
-- current_line_blame_opts = {
--   virt_text = true,
--   virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
--   delay = 1000,
--   ignore_whitespace = false,
-- },
-- current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
-- sign_priority = 6,
-- update_debounce = 100,
-- status_formatter = nil, -- Use default
-- max_file_length = 40000, -- Disable if file is longer than this (in lines)
-- preview_config = {
--   -- Options passed to nvim_open_win
--   border = 'single',
--   style = 'minimal',
--   relative = 'cursor',
--   row = 0,
--   col = 1
-- },
-- yadm = {
--   enable = false
-- },
}

require('neoscroll').setup()
require("telescope").setup({
extensions = {
    coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
        },
    emoji = {
        action = function(emoji)
        -- argument emoji is a table.
        -- {name="", value="", cagegory="", description=""}

        --   vim.fn.setreg("*", emoji.value)
        --  print([[Press p or "*p to paste this emoji]] .. emoji.value)

        -- insert emoji when picked
        vim.api.nvim_put({ emoji.value }, 'c', false, true)
        end,
        },

    gitmoji = {
        action = function(entry)

        -- ask for type of commit
        -- the user can select from a list of commit types
        -- they are numbered so the user can type the number
        local commit_types = {
            "1. feat: A new feature",
            "2. fix: A bug fix",
            "3. docs: Documentation only changes",
            "4. style: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)",
            "5. refactor: A code change that neither fixes a bug nor adds a feature",
            "6. perf: A code change that improves performance",
            "7. test: Adding missing tests or correcting existing tests",
            "8. build: Changes that affect the build system or external dependencies (example scopes: gulp, broccoli, npm)",
            "9. ci: Changes to our CI configuration files and scripts (example scopes: Travis, Circle, BrowserStack, SauceLabs)",
            "10. chore: Other changes that don't modify src or test files",
            "11. revert: Reverts a previous commit",
            "12. WIP: Work in progress",
            }

        -- let the user choose a commit type
        local commit_type = vim.fn.inputlist(commit_types)

        -- parse the commit type from the list
        local commit_type = commit_types[commit_type]

        -- get the commit type from the string
        -- e.g. "1. feat: A new feature" -> "feat"
        commit_type = string.match(commit_type, "%d%. (%w+):")

        -- reset the cmdline
        vim.cmd [[redraw]]

        -- ask for scope of commit with instructions
        local scope = vim.fn.input("Scope of commit, a scope MUST consist of a noun describing a section of the codebase: ")

        -- define instructions for inputting the description
        local description_instructions = "Short description of commit, MUST be in the imperative, present tense, MUST NOT be more than 50 characters: "

        local description = vim.fn.input(description_instructions)
        -- if the description is longer than 50 characters, then ask to edit it
        -- until it is shorter than 50 characters
        while string.len(description) > 50 do
            -- ask to edit the description
            -- ask again but with the previous description as the default
            description = vim.fn.input(description_instructions, description)
            end

            -- if the description ends with a period, then remove it
            if string.sub(description, -1) == "." then
                description = string.sub(description, 1, -2)
            end

            -- if the description contains any capital letters, then lowercase them
            description = string.lower(description)

            -- ask for a longer description of the commit
            local body = vim.fn.input("Longer description of commit: ")

            -- if the description is longer than 72 characters, then wrap insert a newline
            -- every 72 characters, or at the nearest space before 72 characters
            if string.len(body) > 72 then
                local new_body = ""
                local i = 1
                while i+71 < string.len(body) do
                    -- find the nearest space before 72 characters
                    -- cycle backwards from 72 characters until a space is found
                    space = 72
                    while space > 0 and string.sub(body, space + i, space + i) ~= " " do
                    space = space - 1
                    end
                    
                    -- if there is no space before 72 characters, then just insert a newline
                    if space == 0 then
                        new_body = new_body .. string.sub(body, i, i + 71) .. "-\n"
                        i = i + 72
                    else
                        -- if there is a space before 72 characters, then insert a newline
                        -- at the space
                        new_body = new_body .. string.sub(body, i, i + space - 1) .. "\n"
                        i = i + space + 1
                    end
                end
                --add the last line of the body
                new_body = new_body .. string.sub(body, i)
                -- set the body to the new body
                body = new_body
            end
            -- ask for a list of breaking changes
            local breaking_changes = vim.fn.input("List of breaking changes: ")
            -- if there are breaking changes, prefix them with BREAKING-CHANGE:
            -- if there are no breaking changes, then set breaking to an empty string
            if breaking_changes ~= "" then
                breaking_changes = "BREAKING-CHANGE: " .. breaking_changes .. "\n"
            end
            -- ask the user to sign off on the commit
            local signoff = vim.fn.input("Enter your name to sign off on the commit: ")
            -- if the user entered a name, then sign off on the commit
            -- if the user did not enter a name, then do not sign off on the commit
            if signoff ~= "" then
                signoff = "Signed-off-by: " .. signoff
            end
            -- get the emoji from the entry, as a string
            local emoji = entry.value.value
            --compose the commit message
            local message = emoji .. commit_type .. "(" .. scope .. "): "
            message = message .. description .. "\n\n" .. body .. "\n\n"
            message = message .. breaking_changes .. signoff .. "\n"
            -- insert the commit message into the current buffer
            vim.api.nvim_command("normal! i" .. message)
            -- move the cursor to the start of the buffer
            -- so that the user can edit the commit message
            vim.api.nvim_command("normal! gg")
            -- leave insert mode
            vim.api.nvim_command("stopinsert")
        end,
        },
    },
})
require('telescope').load_extension('coc')
require("telescope").load_extension("emoji")
require('telescope').load_extension("gitmoji")

EOF

" }}}
" QuickFix / Location List {{{

" setup and settings for todo-comments plugin
lua << EOF
require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    signs = true, -- show icons in the signs column
    sign_priority = 20, -- sign priority
    }
EOF

" navigate chunks of current buffer
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)

" create text object for git chunks
omap ic <Plug>(coc-git-chunk-inner)
xmap ic <Plug>(coc-git-chunk-inner)
omap ac <Plug>(coc-git-chunk-outer)
xmap ac <Plug>(coc-git-chunk-outer)

"use dp to stage chunks when not in diff mode
nnoremap <expr> dp &diff ? 'dp' : ':CocCommand git.chunkStage<cr>'

" navigate jumplist
nnoremap <leader>j :Telescope jumplist<cr>
nnoremap ]j <C-I>
nnoremap [j <C-O>

" navigate quickfix list
nnoremap <leader>q :Telescope quickfix<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

" navigate location list
nnoremap <leader>l :Telescope loclist<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>

" open todo list in telescope with leader t
nnoremap <leader>t :TodoTelescope<CR>

"navigate todo list

if has('nvim')
    " open terminal mode in new split with <leader>k
    nnoremap <leader>k :split<CR>:term<CR>A
    " exit terminal mode with <C-[>
    tnoremap <C-[> <C-\><C-n>
endif

" }}}
" More Settings {{{

filetype on
filetype plugin indent on
filetype plugin on
set t_Co=256
"set term=xterm-256color
"Set the colorscheme
colorscheme challenger_deep
set background=dark

augroup bufenter
  autocmd!
  " if the file is not contained in the working directory
  " then change the working directory to the file's directory
  autocmd BufEnter * if expand('%:p') !~# getcwd() | lcd %:p:h | endif
augroup END

augroup commit
  autocmd!
  " if the buffer is a new commit message buffer then open Telescope gitmoji
  autocmd BufEnter *.git/COMMIT_EDITMSG if !exists('b:entered') |
        \ let b:entered = 1 |
        \ set colorcolumn=72 |
        \ execute 'Telescope gitmoji' |
        \ endif
augroup END

autocmd FileType markdown set conceallevel=3
" set foldmethod=marker

" settings for indent guides plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_exclude_filetypes = ['help', 'startify', 'tagbar', 'vista', 'vista_markdown']

autocmd FileType php setlocal commentstring=//\ %s

" antoinemadec/FixCursorHold.nvim setting
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100

" key maps to resize splits
nnoremap <tab><Up> <C-w>+<C-w>+<C-w>+<C-w>+<C-w>+
nnoremap <tab><Down> <C-w>-<C-w>-<C-w>-<C-w>-<C-w>-
nnoremap <tab><Left> <C-w><<C-w><<C-w><<C-w><<C-w><
nnoremap <tab><Right> <C-w>><C-w>><C-w>><C-w>><C-w>>

" toggle list mode (hidden characters)
nnoremap <leader>- :set list!<CR>

" map backspace to go back to last buffer
nnoremap <bs> <C-^>

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
" get nvim version number
let g:version = system('nvim --version | head -n 1 | cut -d " " -f 2')
" remove trailing newline
let g:version = substitute(g:version, '\n\+$', '', '')
let g:startify_custom_header =
            \ 'startify#pad(g:ascii + ["nvim " . g:version] + startify#fortune#boxed())'
" custom menus
let g:startify_lists = [
            \ { 'header': ['   MRU'],            'type': 'files' },
            \ { 'header': ['   Commands'],       'type': 'commands' },
            \ ]
" }}}
" Fern {{{
let g:fern#renderer = "nerdfont"

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
  nmap <buffer> N <Plug>(fern-action-new-path)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> <C-o> <Plug>(fern-action-open:split)
  nmap <buffer> <C-e> <Plug>(fern-action-open:vsplit)
  nmap <buffer> <C-t> <Plug>(fern-action-open:tabedit)
  "Perform tcd on the root node after enter or leave action
  nmap <buffer> <Plug>(fern-my-enter-and-tcd)
        \ <Plug>(fern-action-enter)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)
        \ <Plug>(fern-action-lcd:root)
  nmap <buffer> <Plug>(fern-my-leave-and-tcd)
        \ <Plug>(fern-action-leave)
        \ <Plug>(fern-wait)
        \ <Plug>(fern-action-tcd:root)
        \ <Plug>(fern-action-lcd:root)
  nmap <buffer> > <Plug>(fern-my-enter-and-tcd)
  nmap <buffer> < <Plug>(fern-my-leave-and-tcd)
  " nmap <buffer> p     <Plug>(fern-action-preview:toggle)
  ""nmap <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  ""nmap <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  ""nmap <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
  " Use 'select' instead of 'edit' for default 'open' action
  nmap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)
  nmap <silent> <buffer> p <Plug>(fern-action-preview:auto:toggle)
  " nmap <buffer> mi <Plug>(fern-action-rename):call MoveToIdeas()
  nmap <buffer> U <Plug>(fern-action-rename)aUnsorted/<ESC>:w<CR>
  nmap <buffer> J <Plug>(fern-action-rename)aJokes/<ESC>:w<CR>
  " nmap <buffer> m :Maps<CR>init.vim fern-action-rename m
  " nmap <buffer> m <Plug>(fern-action-move)
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

" this should be in the fern preview source code but it's not
" getting set, so I added it here to avoid an error message
if !exists('g:fern_preview_window_highlight')
    if has('nvim')
        let g:fern_preview_window_highlight = 'NormalFloat:Normal'
    else
        let g:fern_preview_window_highlight = 'Normal'
    endif
endif

" test if the current working directory contains the current file
" if it does, then open fern in the current working directory
" if it doesn't, then open fern in the directory of the current file
" and switch to the directory of the current file
function! OpenFern() abort
  if expand('%:p') =~ getcwd()
    execute 'Fern -drawer -toggle -reveal=% -width=25 .'
  else
    execute 'lcd ' . expand('%:p:h')
    execute 'Fern -drawer -toggle -reveal=% -width=25 ' . expand('%:p:h')
  endif
endfunction

"toggle fern with <leader> f
nnoremap <silent> <leader>f :call OpenFern()<CR>

" }}}

" FZF {{{

" open in splits and new tabs with Ctrl t/o/e/q
" Tab/hOrizontal/vErtical/Quickfix
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-o': 'split',
      \ 'ctrl-e': 'vsplit',
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
" nnoremap <Leader>b :Buffers<CR>
nnoremap <leader>b :CocCommand fzf-preview.AllBuffers<CR>


" search in current buffer
nnoremap  <Leader>/ :BLines<CR>

" search help
nnoremap  <Leader>h :Helptags<CR>

" history of Recently opened files
nnoremap  <Leader>r :History<CR>

" search for my own mapped commands
nnoremap  <Leader>m :Maps<CR>^<space

" use ripgrep instead of grep by default in vim
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" make :Rg only search for file contents, not file names as well
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

"better ripgrep integration, call RG instead of Rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'border': 'sharp'} }

" Customize fzf colors to match your color scheme
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

" }}}

" Vista and tags stuff {{{

" nnoremap <leader>v :Vista!!<CR>
nnoremap <leader>v :Vista finder<CR>
let g:vista_fzf_preview = ['right:50%']
let g:vista_keep_fzf_colors = 1
let g:vista_default_executive = 'coc'
let g:vista_vimwiki_executive = 'markdown'
" let g:vista#executives = ['ale', 'coc', 'ctags', 'lcn', 'nvim_lsp', 'vim_lsc', 'vim_lsp', 'markdown']
" let g:vista#extensions = ['markdown', 'rst']

" search for tags in the current buffer
" `:Vista finder` also does a similar thing
" but it doesn't seem to play well with coc
" so I might change this map back to `:Vista finder`
" if it is better in future
" map leader o to view outline, aka ctags in a fzf window
" nnoremap <leader>o :Vista finder coc<CR>
" nnoremap  <Leader>o :BTags<CR>
nnoremap <leader>o <C-u>:CocFzfList outline<CR>

" }}}

" Tab Bar {{{

" set mappings to switch tabs
nnoremap <leader>1 :tabn 1<CR>
nnoremap <leader>2 :tabn 2<CR>
nnoremap <leader>3 :tabn 3<CR>
nnoremap <leader>4 :tabn 4<CR>
nnoremap <leader>5 :tabn 5<CR>
nnoremap <leader>6 :tabn 6<CR>
nnoremap <leader>7 :tabn 7<CR>
nnoremap <leader>8 :tabn 8<CR>
nnoremap <leader>9 :tabn 9<CR>

" }}}

" Vim Wiki {{{
let g:vimwiki_list = [{'path': '~/Notes/',
      \ 'syntax': 'markdown', 'auto_toc' : 1,
      \ 'index': '!Index',
      \ 'ext': '.md'}]

let g:vimwiki_key_mappings = { 'headers': 0,
      \ 'table_mappings': 0,
      \ 'global': 0}

nnoremap <leader>w :VimwikiTabIndex<CR>:tcd %:p:h<CR>:TabooRename Vimwiki Notes<CR>:tabm 0<CR>

let g:vimwiki_folding = 'custom'

nnoremap <leader><leader> :call NewNote()<CR>

" create a new note
" usage: <leader><leader> <note name>
" example: <leader><leader> my_note
" will create a new note called my_note.md in the ~/Notes/ directory
" and open it in a new tab
" if the note already exists, it will just open it in a new tab
function! NewNote()
  let note_name = input('Note Name: ')
  " if the user didn't enter anything, exit
  " or if the user entered only whitespace, exit
  if note_name ==# '' || note_name =~# '^\s*$'
    return
  endif

  " remove trailing whitespace
  " and replace spaces with hyphens
  " and remove any non-alphanumeric characters
  " and convert to lowercase
  " and remove leading and trailing hyphens
  let note_name = substitute(note_name, '\s\+$', '', '')
  let note_name = substitute(note_name, '\s', '-', 'g')
  let note_name = substitute(note_name, '[^a-zA-Z0-9-]', '', 'g')
  let note_name = tolower(note_name)
  let note_name = substitute(note_name, '^-', '', '')
  let note_name = substitute(note_name, '-$', '', '')

    let note_path = '~/Notes/' . note_name . '.md'
    if filereadable(note_path)
        execute 'tabedit ' . note_path
    else
        execute 'tabnew ' . note_path
        execute 'normal! i# ' . note_name
    endif
endfunction

" }}}

" Preservim/tagbar settings {{{

"Open/close tagbar with <leader>a
nmap <leader>a :TagbarToggle<CR>

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
    set signcolumn=auto:4
else
    set signcolumn=yes
endif

" prevent conflict with keymapping in vimwiki
au filetype vimwiki silent! iunmap <buffer> <Tab>

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)

" GoTo code navigation.
" default mappings because coc-fzf uses them
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

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

" fuzzy search
nnoremap <leader>c <C-u>:Telescope coc<CR>

" let coc treat vimwiki files as md
let g:coc_filetype_map = {
      \ 'vimwiki': 'markdown',
      \ }

" }}}

" autocomplete coc + github copilot {{{

"make <right> operate the autocomplete
inoremap <silent><expr> <right> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<right>"

" }}}

" Emojis {{{

" call emoji picker with <C-e> in insert mode
imap <C-e> <cmd>lua require('telescope').extensions.emoji.emoji()<CR>

" }}} 

" Formatting {{{

"" this deletes blank lines
"" and blank trailing characters
"" and indents stuff
"" and formats it with coc
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
function! NumberToggle() abort
    set rnu!
endfunction

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

" yanked text fills registers 0-9 {{{

function! SaveLastReg()
    if v:event['regname']==""
        if v:event['operator']=='y'
            for i in range(8,1,-1)
                exe "let @".string(i+1)." = @". string(i)
            endfor
            if exists("g:last_yank")
                let @1=g:last_yank
            endif
            let g:last_yank=@"
        endif
    endif
endfunction

autocmd TextYankPost * call SaveLastReg()

" }}}

" Shortcuts/Remaps {{{

"Shortcuts for git

" open git actions in FZF window
nnoremap <leader>g :CocCommand fzf-preview.GitActions<CR>

" start diff mode
nnoremap <leader>d :Gvdiffsplit<CR>:windo set foldmethod=manual<CR>:windo set foldlevel=20<CR>

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
    highlight Comment ctermfg=120 guifg=#95ffa4
    hi ColorColumn ctermbg=250 guibg=#ff8655
    highlight! link CopilotSuggestion Special
endfunction

" }}}

" After {{{
"This is called after all the plugins and
"settings in this vimrc file are loaded
"it is called by the after.vim file
function! After()
    call Colors()
    "disable plugin maps that slow down my own

    " unmap <Leader>swp
    " unmap <Leader>rwp

    function! fern_preview#width_default_func() abort
        let width = float2nr(&columns * 0.5)
        return width
    endfunction

    " if no session is loaded
    " then use the default session
    " otherwise use the session that was loaded
    if !exists('g:session_loaded')
      if filereadable(expand('~/Session.vim'))
        source ~/Session.vim
      endif
    endif

endfunction

" }}}

" Setup {{{

" This is a first time setup function
" to install/configure LSP servers
" and dependencies etcetera.
cnoreabbrev duncansVimSetup call Setup()
function! Setup()
    CocInstall coc-json coc-sh coc-css coc-html
                \ coc-tsserver coc-markdownlint coc-phpls coc-pyright
                \ coc-git coc-vimlsp coc-fzf-preview coc-explorer
                \ coc-conventional
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


" convert html to markdown {{{
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

endfunction

" }}}


" this has to be loaded after plugins, and it is
" also called here so its settings are persistent after
" re-sourcing this file i.e `:so %`
call Colors()

" vim:fdm=marker
