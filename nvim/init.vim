set backspace=2
set background=dark
set sidescroll=1
set hidden
set mouse=
set scrolloff=20

set lazyredraw

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

let mapleader = "\<Space>"

let g:python_host_prog = '/usr/local/bin/python3'

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

set conceallevel=0

" // searches highlighted text in visual mode
vnoremap // y/<C-R>"<CR>

autocmd! BufWritePost * Neomake
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501'], }
let g:neomake_python_pep8_maker = { 'args': ['--ignore=E501'], }
let g:neomake_python_pylama_maker = { 'args': ['--ignore=E501'], }
let g:neomake_open_list = 2

let g:pymode_lint_ignore = "E231,E501"
let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
let g:pymode_rope = 0
let g:pymode_rope_rename_bind = '<leader>f'
let g:pymode_rope_organize_imports_bind = '<C-c>ro'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0

let g:signify_vcs_list = [ 'git', ]
let g:signify_sign_change = '~'

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignColumn        ctermbg=none

" The Silver Searcher
" if executable('ag')
"   " Use ag over grep
"   set grepprg=ag\ --nogroup\ --nocolor

"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"   if exists("g:ctrlp_user_command")
"       unlet g:ctrlp_user_command
"   endif
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

"   " ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --mmap

" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" ag is fast enough that CtrlP doesn't need to cache
let g:ctrlp_use_caching = 0

set wildignore+=*/node_modules/*

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

nnoremap <right> :bn<enter>
nnoremap <left> :bp<enter>

nnoremap <Backspace> <Nop>

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

autocmd BufWritePre *.py,*.rb,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

" Override json ft stupidity
au BufNewFile,BufRead *.json set filetype=javascript

au BufNewFile,BufRead *.slide set nolist
au BufNewFile,BufRead *.slide set laststatus=0
au BufNewFile,BufRead *.slide let g:indentLine_enabled = 0

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

if has('nvim')
    set inccommand=nosplit
endif

call plug#begin('~/.config/nvim/plugged')

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'tell-k/vim-autopep8'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
Plug 'neomake/neomake'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
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
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'luochen1990/rainbow'
Plug 'maksimr/vim-jsbeautify'
Plug 'klen/python-mode'
Plug 'tpope/vim-endwise'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hecal3/vim-leader-guide'
Plug 'google/vim-searchindex'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jiangmiao/auto-pairs'

call plug#end()

" vim-sessions
let g:sessions_project_path = "$HOME/code"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"easymotion config
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map <Leader>v :vnew<CR>
map <Leader>c :windo if &buftype == "quickfix" <bar><bar> &buftype == "locationlist" <bar> lclose <bar> endif<CR>:pclose<CR>:cclose<CR>

"ctrl-p config
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'e'
" let g:ctrlp_use_caching = 1

" if executable('ag')
"     set grepprg=ag\ --nogroup\ --nocolor
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" else
"   let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"   let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
"     \ }
" endif

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

let g:formatdef_rbeautify = '"rbeautify -s -c 2"'

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
let g:ycm_seed_identifiers_with_syntax = 1

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_goto_buffer_command = 'vertical-split'

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


function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
            "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
noremap <silent> H :call FirstCharOrFirstCol()<cr>
map <Leader>d :call DeleteInactiveBufs()<cr>
