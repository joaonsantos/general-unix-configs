""" Vim Customizations

" Custom keybinds
"
" <C-h>     |- next buffer
" <C-l>     |- previous buffer
" <leader>q |- delete buffer
" <leader>e |- edit vimrc quick
" <leader>A |- toggle linting
" <leader>g |- go to definition or declaration
" <leader>d |- show hover information
" <leader>D |- get documentation

"" General Settings

" Enter the current millenium (optional since vim8)
set nocompatible
set encoding=utf-8
set timeoutlen=1000 ttimeoutlen=0

" Set term colors (needed for lightline as well)
set term=xterm-256color
if !has('gui_running')
  set t_Co=256
endif

" Enable syntax and plugins
syntax enable
filetype plugin indent on

" Confirm changes (yes, no, cancel) instead of error
set confirm

" Set highlighted line on cursor
set cursorline

" Set absolute line numbers
set number

" Search settings
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set nohlsearch    " don't highlight search terms
set incsearch     " show search matches as you type

" Set Tab to be 2 spaces
set smarttab        " insert tabs on the start of a line according to
                    " shiftwidth, not tabstop
set tabstop=2       " The width of a TAB is set to 2.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 2.
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set nojoinspaces    " No double spaces after full stop
set backspace=indent,eol,start


" TAB completion behaviour
set wildmode=longest,list,full
set wildmenu

" Open splits below and right
set splitbelow
set splitright

" General map configurations
" " Stop using the arrows
map <left> <nop>
map <down> <nop>
map <up> <nop>
map <right> <nop>

" Handle buffers
map <C-h> :bn<cr>
map <C-l> :bp<cr>
map <leader>q :bd<cr>

" Handle different file types
augroup FileExtentionsGroup
autocmd!

" Make .tex files load like tex files
autocmd BufNewFile,BufRead *.tex :set ft=tex

" Make .md files load like Markdown files
autocmd BufNewFile,BufRead *.md :set ft=markdown

" Make .docker files load as Dockefile
autocmd BufNewFile,BufRead Dockerfile.* :set ft=dockerfile
autocmd BufNewFile,BufRead *.docker :set ft=dockerfile

augroup END

" Make it so that .md files get automatically formatted
au BufRead,BufNewFile *.md setlocal textwidth=80

" Vim Plugins Section
"
call plug#begin('~/.vim/plugged')

" Add solarized colorscheme
Plug 'ericbn/vim-solarized'

" Add lightline plugin
 Plug 'itchyny/lightline.vim'

" Add git branch information plugin
Plug 'itchyny/vim-gitbranch'

" Add file explorer plugin
Plug 'scrooloose/nerdtree'

" Add completion engine
Plug 'valloric/youcompleteme'

" Add linting engine
Plug 'w0rp/ale'

" Add fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'

" Add vim surround
Plug 'tpope/vim-surround'


call plug#end()

" Lightline configurations
set laststatus=2
set noshowmode " Don't show the mode, since it shows on status bar
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name'
  \ },
\ }

" Nerdtree configurations
map <C-n> :NERDTreeToggle<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" You Complete Me configurations
" Close completion preview tab after exiting insertion
let g:ycm_autoclose_preview_window_after_completion=1
" Goto map
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>d  <plug>(YCMHover)
nmap <leader>D  :YcmCompleter GetDoc<CR>

" Ctrl-p configurations
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" A.L.E configurations
let g:ale_linters = {
\   'python': ['flake8'],
\   'javascript': ['eslint'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'isort'],
\   'javascript': ['eslint'],
\}

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--ignore E501,W503,W605'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

map <leader>A :ALEToggle<CR>

" Other keybinds
"
" Edit vim config file quickly
map <leader>e :e $HOME/.vimrc<CR>

" Set colorscheme (must be at the end)
set background=dark
colorscheme solarized
