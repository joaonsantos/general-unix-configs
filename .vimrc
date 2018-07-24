"""" Vim Customizations

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Set Tab to be 2 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Set encoding to utf-8
set encoding=utf-8

" See relative Line Numbers
set number

" Handle Tabs
nnoremap <silent> <C-o> :tabprevious<CR>
nnoremap <silent> <C-p> :tabnext<CR>
nnoremap <silent> <C-t> :tabnew<CR>

" Vim Plugins Section
"
call plug#begin('~/.vim/plugged')

" Add Nord Vim Plugin
Plug 'arcticicestudio/nord-vim'

" Add Airline Plugin
Plug 'vim-airline/vim-airline'

" Add Fugitive Git Wrapper Plugin
Plug 'tpope/vim-fugitive'

" Add Easymotion Plugin
Plug 'easymotion/vim-easymotion'

" Add Surround Plugin
Plug 'tpope/vim-surround'

" Add Additional Python Syntax Plugin
Plug 'hdima/python-syntax'
call plug#end()

" Set Colorscheme
colorscheme nord

" Set airline options
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

" Set Easymotion options
"
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
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

" Reset Leader to Single Slash
map <Leader> <Plug>(easymotion-prefix)

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Hdima Python Plugin Syntax Options
let python_highlight_all = 1

" Stuff to remember
"

"" vimdiff commands
"
    "]c :        - next difference
    "[c :        - previous difference
    "do          - diff obtain
    "dp          - diff put
    "zo          - open folded text
    "zc          - close folded text
    ":diffupdate - re-scan the files for differences
