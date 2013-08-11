set nocompatible
set term=builtin_ansi
let &t_Co=256
set encoding=utf-8
set backspace=2

set background=dark

" Vundle setup
let DoINeedVundle=1
let vundle_readme=expand("~/.vim/bundle/vundle/README.md")
if !filereadable(vundle_readme)
	echo "Installing Vundle"
	echo ""
	silent !mkdir -p ~/.vim/bundle
	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	let DoINeedVundle=0
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'garbas/vim-snipmate'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'honza/vim-snippets'
Bundle 'tomtom/tlib_vim'

Bundle 'myusuf3/numbers.vim'

Bundle 'vim-scripts/The-NERD-tree'

Bundle 'tpope/vim-surround'

Bundle 'mitechie/pyflakes-pathogen'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'sontek/rope-vim'

Bundle 'Lokaltog/vim-easymotion'

Bundle 'airblade/vim-gitgutter'

Bundle 'Lokaltog/vim-powerline'

Bundle 'tpope/vim-fugitive'

Bundle 'terryma/vim-multiple-cursors'

Bundle 'uguu-org/vim-matrix-screensaver'

if DoINeedVundle == 0
	echo "Installing bundles, ignore key map error messages"
	echo ""
	:BundleInstall
endif

set laststatus=2

let g:ycm_key_select_completion = '<F5>'

set foldmethod=indent
set foldlevel=99
filetype plugin indent on
syntax on
