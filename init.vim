"" General Configs

set encoding=utf-8
if &compatible
  set nocompatible
end

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

let g:has_async = v:version >= 800 || has('nvim')
let mapleader = "\\"

set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=100
set ruler         " Show the cursor position all the time
set cursorline    " Set highlighted line on cursor
set showcmd       " Display incomplete commands
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set modelines=0   " Disable modelines as a security precaution
set nomodeline
set number        " Set relative line numbers
set numberwidth=5
set showmatch     " Set show matching parenthesis

"" Search Settings

set incsearch     " Do incremental searching
set smartcase     " Ignore case if search pattern is all lowercase,
                  " Case-sensitive otherwise
set hlsearch      " Highlight search terms
set incsearch     " Show search matches as you type

"" Identation Settings
set backspace=indent,eol,start           " Backspace deletes like most programs in insert mode
set tabstop=2                            " The width of a TAB is set to 2,
                                         " still it is a \t. It is just that
                                         " vim will interpret it to be having
                                         " a width of 2.
set shiftwidth=2                         " Indents will have a width of 2
set softtabstop=2                        " Sets the number of columns for a TAB
set shiftround
set expandtab                            " Expand TABs to spaces

set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set nojoinspaces                         " Use one space, not two, after punctuation.

set textwidth=80

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>


" Vim Plugins
"
call plug#begin('~/.local/share/nvim/plugged')

Plug 'easymotion/vim-easymotion'  " Add Easymotion Plugin
Plug 'tpope/vim-surround'         " Add Surround Plugin
Plug 'scrooloose/nerdtree'        " Add Nerdtree File Explorer Plugin

call plug#end()


" Easymotion configs
let g:EasyMotion_do_mapping = 0        " Disable default mappings
let g:EasyMotion_smartcase = 1         " Turn on Case Insensitive Feature

nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)     " JKWB motions: Line motions
map <Leader>k <Plug>(easymotion-k)
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)

" Nerdtree configs
map <C-n> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" Filetype Options
filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile aliases.local,bashrc.local set filetype=sh
  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
  autocmd BufRead,BufNewFile init.vim.local set filetype=vim
augroup END


"" Misc Configs

" Switch between the last two files
nnoremap <silent> <leader>pf :b#<CR>
" Open next file
nnoremap <silent> <leader>nf :bn<CR>
" Open previous file
nnoremap <silent> <leader>pf :bp<CR>

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

colorscheme desert
