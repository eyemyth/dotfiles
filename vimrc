set nocompatible
set term=xterm
let &t_Co=256
set encoding=utf-8
set backspace=2
set background=dark
set ttyfast
set sidescroll=1
set hidden

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab


set conceallevel=0

let g:ycm_register_as_syntastic_checker = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:pymode_lint_ignore = "E231,E501"
let g:pymode_rope = 0

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


" JSHint options
let jshint2_save = 1
let jshint2_read = 1

filetype off

set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundle 'SirVer/ultisnips'
" Bundle 'honza/vim-snippets'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-surround'
Bundle 'tell-k/vim-autopep8'
Bundle 'easymotion/vim-easymotion'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
"Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
" Bundle 'terryma/vim-multiple-cursors'
" Bundle 'rodjek/vim-puppet'
" Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'godlygeek/tabular'
" Bundle 'kana/vim-arpeggio'
Bundle 'Raimondi/delimitMate'
Bundle 'Yggdroot/indentLine'
" Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-commentary'
Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'juanpabloaj/ShowMarks'
Bundle 'tpope/vim-markdown'
Bundle 'tmhedberg/SimpylFold'
" Bundle 'kchmck/vim-coffee-script'
Bundle 'Shutnik/jshint2.vim'
Bundle 'vim-scripts/django.vim'
" Bundle 'AndrewRadev/splitjoin.vim'
Bundle 'Chiel92/vim-autoformat'
" the following two do basically the same thing
Bundle 'junegunn/vim-easy-align'
Bundle 'tommcdo/vim-lion'
Bundle 'ConradIrwin/vim-bracketed-paste'
Bundle 'luochen1990/rainbow'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'klen/python-mode'
Bundle 'tpope/vim-endwise'
Bundle 'vim-scripts/SyntaxRange'
Bundle 'vim-scripts/ingo-library'
Bundle 'edsono/vim-matchit'
Bundle 'kiteco/plugins', {'rtp': 'vim-kite'}
Bundle 'tpope/vim-unimpaired'
Bundle 'wellle/targets.vim'
Bundle 'tweekmonster/django-plus.vim'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" UltiSnips completion function that tries to expand a snippet. If there's no
" snippet for expanding, it checks for completion window and if it's
" shown, selects first element. If there's no completion window it tries to
" jump to next placeholder. If there's no placeholder it just returns TAB
" key
"
" function! g:UltiSnips_Complete()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips#JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "usnippets"]

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
autocmd! bufwritepost .vimrc source %

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
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
