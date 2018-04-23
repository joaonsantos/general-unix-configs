"""" Vim Customizations

" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" Set Tab to be 4 spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Set encoding to utf-8
set encoding=utf-8

" See relative Line Numbers
set relativenumber

" Vim Plugins Section
"
call plug#begin('~/.vim/plugged')

" Add Nord Vim Plugin
Plug 'arcticicestudio/nord-vim'

" Add Airline Plugin
Plug 'vim-airline/vim-airline'

" Add Fugitive Git Wrapper Plugin
Plug 'tpope/vim-fugitive'

call plug#end()

" Set Colorscheme
colorscheme nord

" Set airline options
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
