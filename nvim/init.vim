set backspace=2
set background=dark
set sidescroll=1
set hidden
set mouse=
set scrolloff=20

set cmdheight=2
set updatetime=300
set signcolumn=yes

set smartindent
set shiftwidth=4
set expandtab

" quickly enter normal mode
set timeoutlen=1000
set ttimeoutlen=0

cabbrev bd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'BD' : 'bdelete')<CR>

filetype plugin indent on

set colorcolumn=80
:highlight ColorColumn ctermbg=234

let mapleader = "\<Space>"

" quick yank and paste system pasteboard register
map <leader><leader>y "+y<CR>
map <leader><leader>yy :norm "+yy<CR>
map <leader><leader>p :norm "+p<CR>


" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" :OR organizes imports
command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')

" Show yank list with leader-y
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>

" Show errors list with leader-e
nnoremap <silent> <Leader>e  :<C-u>CocList -A --normal diagnostics<cr>

nmap <silent> <leader>a <Plug>(coc-diagnostic-next)

"Remove all trailing whitespace
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Always remove whitespace-only lines at the bottom
au BufWrite * silent! :%s#\($\n\s*\)\+\%$##

" Unlist empty buffers as they are created
" TODO: make this work the way I want
" au BufEnter * if empty(&ft) | set nobuflisted | set ft=useless | endif

let g:pandoc#syntax#conceal#use = 0

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_section_c = '%n: %f'

set conceallevel=0

" // searches highlighted text in visual mode
vnoremap // y/<C-R>"<CR>


let g:signify_vcs_list = [ 'git', ]
let g:signify_sign_change = '~'

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignColumn        ctermbg=none

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --mmap

set wildignore+=*/node_modules/*

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

let $FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'

" FZF :Files with preview
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

" hide stuff for presentations
au BufNewFile,BufRead *.slide set nolist
au BufNewFile,BufRead *.slide set laststatus=0
au BufNewFile,BufRead *.slide let g:indentLine_enabled = 0

" Start scrolling 10 lines before the horizontal window border
set scrolloff=10

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
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/django.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/django-plus.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hecal3/vim-leader-guide'
Plug 'google/vim-searchindex'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'qpkorr/vim-bufkill'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()


let coc_global_extensions = [
            \'coc-python', 'coc-json', 'coc-syntax', 'coc-tag', 'coc-tsserver',
            \'coc-tslint-plugin', 'coc-css', 'coc-highlight', 'coc-tabnine']



" arrows for autocomplete list
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<up>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<down>"


let g:sql_type_default = 'pgsql'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)


map <Leader>v :vnew<CR>
map <Leader>c :windo if &buftype == "quickfix" <bar><bar> &buftype == "locationlist" <bar> lclose <bar> endif<CR>:pclose<CR>:cclose<CR>

map <Leader>t :TagbarToggle<CR>

"Source vimrc on save
autocmd! BufWritePost init.vim source %

set laststatus=2

let g:formatdef_autopep8 = "'/usr/local/bin/autopep8 --max-line-length=79 -'"
let g:formatters_python = ['yapf']
let g:autoformat_verbosemode = 0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" au BufWrite * :Autoformat
au BufWrite * silent! :call CocAction('format')

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

" find duplicate lines
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

" Easier/better ^/$
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
map <Leader>d :call DeleteInactiveBufs()<cr>

noremap <silent> H :call FirstCharOrFirstCol()<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType crontab setlocal nowritebackup
