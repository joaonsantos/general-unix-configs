"""" Vim Customizations

"" General Settings

" Enter the current millenium (optional since vim8)
set nocompatible
set encoding=utf-8
set term=xterm-256color
set timeoutlen=1000 ttimeoutlen=0

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
map <C-k> :bd<cr>
map <leader>S :setlocal spell! spelllang=en_gb<CR>

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>b :split<CR>


" Handle different file types
augroup FileExtentionsGroup
autocmd!

" Make .tex files load like tex files.
autocmd BufNewFile,BufRead *.tex :set ft=tex

" Make .md files load like Markdown files.
autocmd BufNewFile,BufRead *.md :set ft=markdown

" Make .docker files load as Dockefile
autocmd BufNewFile,BufRead Dockerfile.* :set ft=dockerfile
autocmd BufNewFile,BufRead *.docker :set ft=dockerfile

augroup END

" Vim Plugins Section
"
call plug#begin('~/.vim/plugged')

" Add solarized colorscheme
Plug 'altercation/vim-colors-solarized'

" Add Airline Plugin
Plug 'vim-airline/vim-airline'

" Add GitGutter Plugin
Plug 'airblade/vim-gitgutter'

" Add Easymotion Plugin
"Plug 'easymotion/vim-easymotion'

" Add Nerdtree File Explorer Plugin
Plug 'scrooloose/nerdtree'

" Add You Complete Me
Plug 'valloric/youcompleteme'

" Add Asynchronous Linting Engine (A.L.E)
Plug 'w0rp/ale'

" Add Ctrl-p fuzzy explorer
Plug 'ctrlpvim/ctrlp.vim'

" Add vim surround
Plug 'tpope/vim-surround'

call plug#end()

" Set airline options
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'  " show full tag hierarchy
let g:airline#extensions#ale#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Set Easymotion options
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on Case Insensitive Feature
let g:EasyMotion_smartcase = 1
"
" " JKWB motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)

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

map <leader>l :ALEToggle<CR>

" Set colorscheme
set background=dark
colorscheme solarized
