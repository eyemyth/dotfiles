set nocompatible
set term=builtin_ansi
let &t_Co=256
set encoding=utf-8
set backspace=2
set background=dark
set ttyfast

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Stop showing syntax at 120 characters
set synmaxcol=120

" Highlight searches
set hlsearch
" Clear search highlighting with esc
nnoremap <esc> :noh<return><esc>
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Show the cursor position
set ruler

" Show the filename in the window titlebar
set title

" Use relative line numbers
" if exists("&relativenumber")
"     set relativenumber
"     au BufReadPost * set relativenumber
" endif

" Assume html is django template
au BufNewFile,BufRead *.html set filetype=htmldjango

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Enhance command-line completion
set wildmenu

" Hide files in NERDTREE
let NERDTreeIgnore = ['\.pyc$', '\.dmg$']

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
    set undodir=~/.vim/undo
endif

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

" Enable bracketed paste mode
if &term =~ "xterm.*"
    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
    cmap <Esc>[200~ <nop>
    cmap <Esc>[201~ <nop>
endif

" JSHint options
let jshint2_save = 1
let jshint2_read = 1

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'tpope/vim-surround'
Bundle 'mitechie/pyflakes-pathogen'
Bundle 'fs111/pydoc.vim'
Bundle 'vim-scripts/pep8'
Bundle 'tell-k/vim-autopep8'
"Bundle 'sontek/rope-vim'
" FIND A REPLACEMENT FOR THIS
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'uguu-org/vim-matrix-screensaver'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle 'kana/vim-arpeggio'
Bundle 'Raimondi/delimitMate'
Bundle 'Yggdroot/indentLine'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
"Bundle 'juanpabloaj/ShowMarks'
Bundle 'tpope/vim-markdown'
Bundle 'tmhedberg/SimpylFold'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Shutnik/jshint2.vim'
Bundle 'vim-scripts/django.vim'


" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB
" key 
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "usnippets"] 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Open NERDTree by default, close if it's the last buffer
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set laststatus=2

"Various YCM settings
"let g:ycm_key_select_completion = '<F5>'
"YouCompleteMe debug mode
"run :YcmDebugInfo to find log files
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'

if DoINeedVundle == 0
    echo "Installing bundles, ignore key map error messages"
    echo ""
    :BundleInstall
endif

cmap w!! %!sudo tee > /dev/null %

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set foldmethod=syntax
set foldlevel=99
filetype plugin indent on
syntax on
