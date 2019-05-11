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

set colorcolumn=80

let mapleader = "\<Space>"

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python3'

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

set conceallevel=0

" // searches highlighted text in visual mode
vnoremap // y/<C-R>"<CR>

" autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8', 'pylama']
let g:neomake_python_flake8_maker = { 'args': ['--ignore=E501,E712'], }
let g:neomake_python_pep8_maker = { 'args': ['--ignore=E501,E712'], }
let g:neomake_python_pylama_maker = { 'args': ['--ignore=E501,E712'], }
let g:neomake_open_list = 0

let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

let g:neomake_rust_enabled_makers = ['cargo']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_section_c = '%n: %f'

let g:signify_vcs_list = [ 'git', ]
let g:signify_sign_change = '~'

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignColumn        ctermbg=none

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --mmap

set wildignore+=*/node_modules/*

" bind K to grep word under cursor
" nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

nnoremap <C-P> :Files<cr>

let g:fzf_buffers_jump = 0

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

set titlestring=%t

"autocmd BufWritePre *.py,*.rb,*.js,*.hs,*.html,*.css,*.scss :%s/\s\+$//e

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
" Plug 'tell-k/vim-autopep8'
Plug 'easymotion/vim-easymotion'
" Plug 'Valloric/YouCompleteMe'
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
Plug 'neomake/neomake'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
" Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'Shutnik/jshint2.vim'
Plug 'vim-scripts/django.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'
" Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'luochen1990/rainbow'
Plug 'maksimr/vim-jsbeautify'
" Plug 'tpope/vim-endwise'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hecal3/vim-leader-guide'
Plug 'google/vim-searchindex'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1

inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<up>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<down>"

call neomake#configure#automake('rw')

" vim-sessions
let g:sessions_project_path = "$HOME/code"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"easymotion config
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

map <Leader>v :vnew<CR>
map <Leader>c :windo if &buftype == "quickfix" <bar><bar> &buftype == "locationlist" <bar> lclose <bar> endif<CR>:pclose<CR>:cclose<CR>

map <Leader>t :TagbarToggle<CR>


"Source vimrc on save
autocmd! BufWritePost init.vim source %

set laststatus=2

"Autopep8 settings
" let g:autopep8_max_line_length=79
" let g:autopep8_aggressive=0
" let g:autopep8_on_save = 1
" let g:autopep8_disable_show_diff=1
" let g:autopep8_ignore="E712"

let g:formatdef_autopep8 = "'/usr/local/bin/autopep8 --max-line-length=79 -'"
let g:formatters_python = ['yapf']
let g:autoformat_verbosemode=0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

au BufWrite * :Autoformat

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
let g:ycm_goto_buffer_command = 'same-buffer'

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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType crontab setlocal nowritebackup
