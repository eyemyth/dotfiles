let &t_Co=256
set backspace=2
set background=dark
set sidescroll=1
set hidden

set lazyredraw

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let g:python_host_prog = '/usr/local/bin/python'

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

set conceallevel=0


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:pymode_lint_ignore = "E231,E501"
let g:pymode_rope = 1

let g:airline#extensions#tabline#enabled = 1

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

nnoremap <right> :bn<enter>
nnoremap <left> :bp<enter>

" Stop showing syntax at x characters
set synmaxcol=500

" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch

" Show the cursor position
set ruler

" Show the filename in the window titlebar
set title

autocmd BufWritePre *.py,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Assume html is django template
" au BufNewFile,BufRead *.html set filetype=htmldjango
" autocmd BufNewFile,BufRead *.rs abbreviate pl println!()

" Override json ft stupidity
au BufNewFile,BufRead *.json set filetype=javascript

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Use + and - to resize splits
if bufwinnr(1)
  map + <C-W>>
  map - <C-W><
endif

" Enhance command-line completion
set wildmenu


" Centralize backups, swapfiles and undo history
set backupdir=~/.config/nvim/backups
set directory=~/.config/nvim/swaps
if exists("&undodir")
    set undodir=~/.config/nvim/undo
endif

" Vim-plug setup
let DoINeedVimPlug=1
let vim_plug_readme=expand("~/.config/nvim/autoload/plug.vim")
if !filereadable(vim_plug_readme)
    echo "Installing vim-plug"
    echo ""
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let DoINeedVimPlug=0
endif


" JSHint options
let jshint2_save = 1
let jshint2_read = 1

filetype off


call plug#begin('~/.config/nvim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'tell-k/vim-autopep8'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'Shutnik/jshint2.vim'
Plug 'vim-scripts/django.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'luochen1990/rainbow'
Plug 'maksimr/vim-jsbeautify'
Plug 'klen/python-mode'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'
Plug 'edsono/vim-matchit'
Plug 'kiteco/plugins', {'rtp': 'vim-kite'}
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"easymotion config
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

"ctrl-p config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 1
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|jpg|png|gif|pyc)$',
  \ }


"Source vimrc on save
autocmd! bufwritepost init.vim source %

set laststatus=2

"Autopep8 settings
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1

let g:formatdef_autopep8 = "'autopep8 --aggressive --max-line-length=79 -'"
let g:formatters_python = ['autopep8']
let g:autoformat_verbosemode=1

let g:rainbow_active = 1

let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'htmldjango': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold', 'start=/{%/ end=/%}/'],
\       },
\       'css': 0,
\   }
\}

"Various YCM settings
"let g:ycm_key_select_completion = '<F5>'
"YouCompleteMe debug mode
"run :YcmDebugInfo to find log files
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
let g:ycm_python_binary_path = 'python'
let g:ycm_register_as_syntastic_checker = 0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

if DoINeedVimPlug == 0
    echo "Installing bundles, ignore key map error messages"
    echo ""
    :PlugInstall
endif

cmap w!! %!sudo tee > /dev/null %

"Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" hack for https://github.com/neovim/neovim/issues/2048
if has('nvim')
    nmap <BS> <C-W>h
endif

"Make XML pretty with :PrettyXML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

function! HighlightRepeats() range
  let lineCounts = {}
  let lineNum = a:firstline
  while lineNum <= a:lastline
    let lineText = getline(lineNum)
    if lineText != ""
      let lineCounts[lineText] = (has_key(lineCounts, lineText) ? lineCounts[lineText] : 0) + 1
    endif
    let lineNum = lineNum + 1
  endwhile
  exe 'syn clear Repeat'
  for lineText in keys(lineCounts)
    if lineCounts[lineText] >= 2
      exe 'syn match Repeat "^' . escape(lineText, '".\^$*[]') . '$"'
    endif
  endfor
endfunction

command! -range=% HighlightRepeats <line1>,<line2>call HighlightRepeats()

"Python Mode settings
:highlight ColorColumn ctermbg=234

" Jump to first character or column
noremap L $
noremap <silent> H :call FirstCharOrFirstCol()<cr>

function! FirstCharOrFirstCol()
  let current_col = virtcol('.')
  normal ^
  let first_char = virtcol('.')
  if current_col <= first_char
    normal 0
  endif
endfunction

set foldmethod=syntax
set foldlevel=99
filetype plugin indent on
let python_highlight_all=1
syntax on
