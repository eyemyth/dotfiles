set nocompatible
set term=builtin_ansi
let &t_Co=256
set encoding=utf-8
syntax on
set backspace=2

set background=dark


set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/snipmate-snippets'
Bundle 'tomtom/tlib_vim'

Bundle 'myusuf3/numbers.vim'

Bundle 'vim-scripts/The-NERD-tree'

Bundle 'tpope/vim-surround'

Bundle 'mitechie/pyflakes-pathogen'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'sontek/rope-vim'

Bundle 'Lokaltog/vim-easymotion'

"Bundle 'Valloric/YouCompleteMe'

Bundle 'airblade/vim-gitgutter'

Bundle 'Lokaltog/vim-powerline'

Bundle 'tpope/vim-fugitive'

Bundle 'terryma/vim-multiple-cursors'


set laststatus=2

let g:ycm_key_select_completion = '<F5>'

set foldmethod=indent
set foldlevel=99
filetype plugin indent on
