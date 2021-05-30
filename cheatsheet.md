# Duncan's Vim Cheat Sheet
```asciiart
`  _____                              _      __      ___             `
` |  __ \                            ( )     \ \    / (_)            `
` | |  | |_   _ _ __   ___ __ _ _ __ |/ ___   \ \  / / _ _ __ ___    `
` | |  | | | | | '_ \ / __/ _` | '_ \  / __|   \ \/ / | | '_ ` _ \   `
` | |__| | |_| | | | | (_| (_| | | | | \__ \    \  /  | | | | | | |  `
` |_____/ \__,_|_| |_|\___\__,_|_| |_| |___/     \/   |_|_| |_| |_|  `
` Cheat Sheet
```
This file is a cheat sheet of commands I use relating to my own vim
configuration and work flows.
Mostly stuff I forget a lot and have to refer to, or stuff I'm still
learning, which is everything.
`:CS` - open this cheat sheet
`gt` - switch tabs
`<TAB>h` - change focussed window, replace `h` with `j/k/l` for directions
`<leader>` means the space bar
`<leader>z` - to fold and unfold
`<leader>v` - toggles vista, for LSP tags and TOC
`<leader>f` - toggles Fern file directory viewer
`<leader>a` - toggles Tagbar, for universal Ctags
`<leader>s` - fuzzy file search
`<leader>m` - fuzzy search for key mappings
`<leader>h` - fuzzy search help
`:SN` - open Simplenote
_______________________________________________________________________
## Vim
### Verbs
### Nouns
### Operations
modifiers
text objects
_______________________________________________________________________
## Fern
`n` - new file or folder
`D` - delete file or folder (actually move to trash)
`m` - move file
`-` - mark file
`M` - rename file(s) and/or folders
`!` - toggle hidden files/folders
`r` - reload fern
`>` - enter folder (and change tabs working directory)
`<` - go back/up one folder (and change tabs working directory)
`B` - add bookmark
`cd` - change working directory
`<leader>f` - toggle fern
`Ctrl-t` open in new Tab
`Ctrl-o` open hOrizontal split
`Ctrl-e` open vErtical split
_______________________________________________________________________
## FZF
`Ctrl-t` open in new tab
`Ctrl-o` open in hOrizontal split
`Ctrl-e` open in vErtical split
FZF search syntax
`^`
^ foo
`^` - e.g `^ foo` search for things starting with foo
bar $
search for things ending with bar
' search for exact phrase
foo |  bar
search for foo OR bar
foo !bar
search for foo NOT bar
`<leader>s` - Search for a file name
`<leader>i` - search Inside files
`<leader>b` - Buffers currently open
`<leader>/` - search lines in this buffer
`<leader>h` - Help
`<leader>r` - Recent files
`<leader>m` - My mapped commands
___
### Other FZF commands
___
these may or may not be useful
I haven't mapped them to anything easier
Command history
:History:
search history
:History/
Lines in loaded buffers
:Lines
snippets from ultisnips
:Snippets
normal mode mappings
:Maps
available commands
:Commands
tags in the project
:Tags
tags in the current buffer :BTags
search marks
:Marks
_______________________________________________________________________
## Tabs
change to next or previous tab
`gt`
`gT`
change to tab n
`n gt`
_______________________________________________________________________
## Simplenote
`:SN` - open simplenote in a new tab
`:SNT` - edit tags for current note
`:SN tag1 tag2` - open simplenote and search for notes with tag1 or tag2
`:SimplenoteUpdate` - update current note
`:SimplenoteTrash` - move current note to trash
`:SimplenoteDelete` - delete current note completely
`:SimplenotePin` -pin current note
`:SimplenoteUnpin` - unpin current note
:SimplenoteOpen <notekey> -open specific note directly
:vnew  -new buffer
:SimplenoteNew -save current buffer as new note
:SimplenoteList -refresh list
:SimplenotePin -pin the currently open note
_______________________________________________________________________
## Markdown
This is a basic list of markdown syntax which all works well with
both Vim, and Simplenote on the web.
```
# heading 1
## heading 2
### heading 3
#### heading 4
##### heading 5
```
*italic*
**bold**
***bold italic***
>Blockquote
## Code
```
codeblock
between three backticks on two lines
```
```php
<?
// codeblock with php highlighting
// append php to the first line of
// backticks
class phpClassExample
{
public function phpFunctionExample()
{
}
}
?>
```
`code inline`
## Lists
* bullet point
- bullet point
+ bullet point
- [ ] checklist
- [x] checked checklist
		1. ordered list
		2. ordered list
		3. ordered list
## Tables
use three or more hyphens --- and pipes |
header 1  | header 2
----------|---------
row 1 col1|row 1 col 2
row 2 col1|row 2 col 2
[hyperlink text](https://hyperlink_url)
to make a horizontal rule, three or more underscores _
_______________________________________________________________________
_______________________________________________________________________
## Git
### Git-Flow
HOW GIT-FLOW BRANCHES WORK
```asciiart
`  bugfix                        o--o                o--o                   `
`                               /    \              /    \                  `
`  feature    o--o--o        o--o------o----o      /      \                 `
`            /       \      /                \    /        \                `
`  develop   o-----o-o-----o--o-o-------------o--o----o-----o----------o--  `
`             \        /             /    \          /                /     `
`  release     o--o---o             /      o----o---o                /      `
`                      \           /           /     \              /       `
`                       \         /           /       \            /        `
`  hotfix                \   o---o        o--o         \          /         `
`              v1.1       \ /     \      /    \         \        /          `
`  master  o----o----------o-------o-----o----o----------o------o--------   `
`          v1    \        v1.2    v1.2.1      v1.2.2   v1.3    / v1.3.1     `
`                 \                                           /             `
`  hotfix          \                                    o----o              `
`                   \                                  /      \             `
`  support           o--------------------------------o--------o v1.1.1     `
```
two primary branches, 'master' and 'develop'
* 'master' always reflects the most current production ready state of the software
* 'develop' reflects the lastest development for the next release
* 'feature' branches are to develop specific features, which are then merged
		into 'develop' when they are ready
* 'release' branches are to ready the 'develop' branch from a chosen point to merge
		with 'master' for a release, after any big fixes they are merged with 'master' and
		back into 'develop'
* 'hotfix' branches are to fix any bugs in a release, and merged straight back
		into 'master' and also merged into 'develop' or 'release' if there is a
		release branch open at the time, the 'release' branch will then be merged back
		into 'develop' anyway
* 'support' branches fork from the master branch to support previous versions of the software and are not merged back into master. A 'hotfix' can be used to fix
		bug and then merge the fix back into the 'support' branch AND the 'master' branch AND the 'develop' branch (possibly via an open release branch), so, for example, version
		1.2 will be fixed to version 1.2.1 on the 'support' branch as well as fixing version 2.0 to version
		2.0.1 on the 'master' branch
* 'bugfix' branches are forked from a 'feature' branch, or the 'develop' branch,
		to fix one bug, similar to a 'hotfix' branch fixing one bug on a release on
		the master branch
### Git Commands
make a new git repo
:G init
initialise git-flow, this creates the branches
:G flow init
note :!git flow init does not work from inside vim with my configuration, but
using the fugitive plugin i.e :G instead of :!git did work
create a feature branch
:G flow feature start feature_branch_name
finish the feature branch, merge back to develop
:G flow feature finish feature_branch_name
start a release branch
:G flow release start 0.1.0
finish a release branch
:G flow release finish '0.1.0'
I haven't tried these commands yet, change this file if I have to do something
else to get them to work...
hotfix branch commands
:G flow hotfix start hotfix_branch_name
:G flow hotfix finish hotfix_branch_name
to save the file
_______________________________________________________________________
### Fugitive and other Git key-bindings
`<leader>g` - opens git status and branch info in two windows
`<leader>d` - opens a git diff for the current buffer
:Gwrite or :Gw
this will save the file, and also works like :git add to write to the index
version of the file
to save the branch
:G add .
:G commit
to sync changes with the online repository
:G push
to change branches use the Twiggy plugin for visual navigation
from inside a buffer in the git repository
:Twiggy
create a new branch
:!git checkout -b feature_x
or
:!git branch feature_x
:!git push -u origin feature_x
to merge
:G checkout branch_to_merge_to
:G merge branch_to_merge_from
_______________________________________________________________________
## Useful Commands
to open 2 buffers in a vertical split
:buffers
to find the list of buffer numbers, we want x and y
:tab sb x
opens buffer x in a new tab
:vert sb y
opens buffer y in a vertical split
:sb y
opens buffer y in a horizontal split
to compare them run
:diffthis
in both windows
or call a function I wrote in my .vimrc
:call Diff(x, y)
to open buffer x in current window
:bx
toggle line numbering
<C-n>
format code for whole file
\=
toggle search highlighting
\h
_______________________________________________________________________
### Search And Replace
:s/searchterm/replacewith/g
:s/searchterm/replacewith/gc ask for confirmation first
:s/<searchterm\>/replacewith/g only whole words exactly matching searchterm
:s/searchterm/replacewith only in selected text
_______________________________________________________________________
### Search And Replace In Multiple Files
from an article here
https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
1. Clear our buffers (:Buffers) first. Our buffers list should contain only the needed files.
We can clear it with `%bd | e# | bd#` (or restart Vim).
2. Run `:Files`.
3. Select all files you want to perform search and replace on. To select multiple files, use Tab / Shift+Tab. This is only possible if we have -m in FZF_DEFAULT_OPTS.
4. Run `:bufdo %s/pizza/donut/g | update`
Our command :bufdo %s/pizza/donut/g | update looks similar to :cfdo %s/pizza/donut/g | update. That's because they are. Instead of performing substitution on all quickfix (cfdo) entries, we perform our substitution on all buffer (bufdo) entries.
_______________________________________________________________________
open file
:e /path/to/file
initialise composer on a new project
:!composer init
update composer repositories
:!composer update
_______________________________________________________________________
## GPG
The jamessan/vim-gnupg plugin implements transparent editing of gpg encrypted files
Gnugpg must first be installed with these commands
sudo apt-get install gnupg gnupg2
alias gpg="gpg2"
and any encryption keys needed should be handled by GnuPG
for example to import a key use
gpg --import patt/to/private.key
to open a url under the cursor
gx
_______________________________________________________________________
## Grep
grep -rl
_______________________________________________________________________
## Working Directory
The present working directory can be displayed in Vim with:
:pwd
To change to the directory of the currently open file (this sets the current directory for all windows in Vim):
:cd %:p:h
You can also change the directory only for the current window (each window has a local current directory that can be different from Vim's global current directory):
:lcd %:p:h
In these commands, % gives the name of the current file, %:p gives its full path, and %:p:h gives its directory (the "head" of the full path).
_______________________________________________________________________
## Tags/Toc
`<leader>v` - toggle Vista
`<leader>t` - tag search with Vista and FZF
`<leader>a` - open tagbar
_______________________________________________________________________
## Folding
`zc` - close current fold
`zo` - open current fold
`za` - toggle current fold
`zC` - close all levels of folds at cursor position
`zO` - open all levels of folds at cursor position
`zA` - toggle all levels of folds at cursor position
`zr` - reduce folding by level throughout buffer
`zR` - open all folds through buffer
`zm` - increase folding by level throughout buffer
`zM` - close all folds throughout buffer
_______________________________________________________________________
## Lsp
While editing a file with a supported filetype:
:LspInstallServer
To uninstall server:
:LspUninstallServer server-name
Because there is no way to update a server, please run :LspInstallServer again, the newer version will be installed.
some commands that might be useful
:LspPeekDefinition
:LspDocumentFormat
:LspDocumentRangeFormat
:LspHover
:LspPeekImplementation
:LspPeekTypeDefinition
these can all be mapped in this format
nnoremap <plug>(lsp-peek-definition)
_______________________________________________________________________
## Debug
`F5` - opens the debug windows in a new tab
`F2` - go to next line
```php
xdebug_break();
```
insert that into PHP code to make a breakpoint
_______________________________________________________________________
## Conqerer of Completion
`<leader>c` - will open the coc menu
`K` - display info
_______________________________________________________________________
