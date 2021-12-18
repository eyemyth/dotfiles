" https://github.com/GideonWolfe/vim.reaper/tree/master/nvim/configs

"""""""""""
" plugins "
"""""""""""

" Install vim-plugged if not already installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-surround'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'tpope/vim-commentary'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-scripts/django.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'junegunn/vim-easy-align'
Plug 'tommcdo/vim-lion'
Plug 'p00f/nvim-ts-rainbow'
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim'
Plug 'tweekmonster/django-plus.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hecal3/vim-leader-guide'
Plug 'google/vim-searchindex'
Plug 'neovim/node-host', { 'do': 'npm install' }
"Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'jiangmiao/auto-pairs'
Plug 'majutsushi/tagbar'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lifepillar/pgsql.vim'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'maxmellon/vim-jsx-pretty'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'qpkorr/vim-bufkill'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'lambdalisue/lista.nvim'
" Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vista.vim'
Plug 'direnv/direnv.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'ncm2/float-preview.nvim'
Plug 'tpope/vim-eunuch'
Plug 'dense-analysis/ale'
Plug 'metakirby5/codi.vim'
Plug 'qpkorr/vim-renamer'
Plug 'petobens/poet-v'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'
Plug 'npxbr/glow.nvim', {'do': ':GlowInstall', 'branch': 'main'}
Plug 'eyemyth/nvim-solarized-lua'
Plug 'vv9k/bogster'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'kyazdani42/nvim-web-devicons'

" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
" Need to **configure separately**

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

call plug#end()


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
EOF

lua << EOF
require'lspconfig'.bashls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.jsonls.setup{
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
require'lspconfig'.jedi_language_server.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.sqlls.setup{}
require'lspconfig'.tsserver.setup{}

require'lspconfig'.html.setup{}
require'lspconfig'.eslint.setup{}
EOF

" https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#eslint
" autocmd BufWritePre <buffer> <cmd>EslintFixAll<CR>

let g:coq_settings = { 'auto_start': v:true, 'clients.tabnine.enabled': v:true, 'display.pum.fast_close': v:false,  "keymap.jump_to_mark": '<c-q>' }

set relativenumber

let g:context_add_mappings=0

set backspace=2
" set background=dark
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

set diffopt+=vertical

" quickly enter normal mode
set timeoutlen=1000
set ttimeoutlen=0

"Turn on backup option
set backup
"Where to store backups
set backupdir=$XDG_DATA_HOME/nvim/backups
"Make backup before overwriting the current buffer
set writebackup
"Keep original backup file
set backupcopy=no
"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

cabbrev bd <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'BD' : 'bdelete')<CR>

filetype plugin indent on

set colorcolumn=80
highlight ColorColumn ctermbg=234

let mapleader = "\<Space>"

" quick yank and paste system pasteboard register
map <leader><leader>y "+y<CR>
map <leader><leader>yy :norm ^"+y$<CR>
map <leader><leader>p :put +<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" " Remap keys for gotos
nmap <silent> gd v:lua vim.lsp.buf.definition()<CR>
" nmap <silent> gD v:lua vim.lsp.buf.declaration()<CR>

" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Show yank list with leader-y
" nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>

" Show errors list with leader-e
" nnoremap <silent> <Leader>e  :<C-u>CocList -A --normal diagnostics<cr>

nmap <silent> <leader>a :ALENext<cr>
" nmap <silent> <leader>a <Plug>(coc-diagnostic-next)

"Remove all trailing whitespace
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Always remove whitespace-only lines at the bottom
" au BufWrite * silent! :%s#\($\n\s*\)\+\%$##

" Unlist empty buffers as they are created
augroup note
    " autocmd BufWinEnter * if empty(&ft) | set ft=note | set nobuflisted | endif
    autocmd BufWinEnter * if empty(&ft) | set nobuflisted | endif
    " autocmd FileType note autocmd! InsertEnter <buffer> call CreateNote()
augroup END

function! CreateNote() range
    set buflisted
    let l:extension = '.' . fnamemodify( "note", ':e' )
    if len(l:extension) == 1
        let l:extension = '.txt'
    endif

    let l:filename = escape( fnamemodify("notes/", ':r') . strftime("%Y-%m-%d_%H-%M") . l:extension, ' ' )
    execute "edit " . l:filename
    Mkdir!
endfunction

let g:pandoc#syntax#conceal#use = 0

let g:python3_host_prog = '/Users/jay_thompson/.pyenv/shims/python'
let g:python_host_prog = '/Users/jay_thompson/.pyenv/shims/python'

" let g:airline_powerline_fonts = 1
" let g:airline_theme='dark'

" let g:airline_statusline_ontop = 0

" let g:airline_exclude_preview = 1

" let g:airline#extensions#syntastic#enabled = 1

" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_tabs = 0
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#tagbar#flags = 'f'

" let g:airline_section_c = '%n: %f'
" let g:airline_section_x = airline#section#create_right(['vista', 'grepper'])

" let g:airline#extensions#bufferline#enabled = 1
" let g:airline#extensions#virtualenv#enabled = 0
" let g:airline#extensions#poetv#enabled = 0
" let g:airline_inactive_collapse=1

set conceallevel=0

" // searches highlighted text in visual mode
vnoremap // y/<C-R>"<CR>

let g:signify_vcs_list = [ 'git', ]
let g:signify_sign_change = '~'

highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignColumn        ctermbg=none

highlight Pmenu          ctermfg=242 ctermbg=0 guibg=DarkGrey
highlight PmenuSel       ctermfg=0 ctermbg=13 guibg=Magenta

highlight PmenuSbar      ctermbg=248 guibg=Grey
highlight PmenuThumb     ctermbg=15 guibg=White

" Use ag over grep
set grepprg=ag\ --nogroup\ --nocolor\ --mmap

set wildignore+=*/node_modules/*

" bind \ (backward slash) to grep shortcut
nnoremap \ :Ag<SPACE>

let $FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore -g ""'

" FZF :Files with preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:fzf_tags_command = 'generate_tags'

nnoremap <C-P> :Files<cr>
nnoremap <Leader>t :BTags<cr>
nnoremap <C-T> :Tags<cr>

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

" Start scrolling 5 lines before the horizontal window border
set scrolloff=5

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


" JSHint options
let jshint2_save = 1
let jshint2_read = 1

if has('nvim')
    set inccommand=nosplit
endif

let g:vista#renderer#enable_icon = 1
let g:vista_fzf_preview = ['right:50%']

let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_sidebar_position = 'vertical topleft'
let g:vista_sidebar_width = 50
let g:vista_close_on_jump = 1
let g:vista_floating_delay = 1000

map <Leader>tt :Vista!!<CR>

" let coc_global_extensions = [
"             \'coc-lists', 'coc-yaml', 'coc-snippets', 'coc-html', 'coc-yank',
"             \'coc-python', 'coc-json', 'coc-syntax', 'coc-tag', 'coc-tsserver',
"             \'coc-eslint', 'coc-css', 'coc-highlight', 'coc-tabnine', 'coc-prettier']

" autocmd CursorHold * silent call CocActionAsync('highlight')

let g:rustfmt_autosave = 1

" arrows for autocomplete list
inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<up>"
inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<down>"

let g:sql_type_default = 'pgsql'

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

map <Leader>v :vnew<CR>

" TODO
" function! CloseGarbage()
"     :windo if &buftype == "nofile"
"         :close
"     endif
"     :windo if &buftype == "quickfix"
"         :lclose
"     endif
"     :windo &buftype == "locationlist"
"         :lclose
"     endif
"     :pclose
"     :cclose
" endfunction

map <Leader>c :windo if &buftype == "quickfix" <bar><bar> &buftype == "locationlist" <bar> lclose <bar> endif<CR>:pclose<CR>:cclose<CR>


"Source vimrc on save
autocmd! BufWritePost init.vim source %

" set laststatus=0

let g:formatdef_autopep8 = "'/usr/local/bin/autopep8 --max-line-length=79 -'"
let g:formatters_python = ['yapf']
let g:autoformat_verbosemode = 0
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" let g:formatdef_javascript_prettier = '"npx" "prettier" "--write"'
" let g:formatters_javascript = ['javascript_prettier']

" au BufWrite * :Autoformat
" au BufWrite * silent! :call CocAction('format')

let g:formatdef_rbeautify = '"rbeautify -s -c 2"'

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

map <Leader>z :bd<cr>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType crontab setlocal nowritebackup
autocmd FileType python let b:AutoPairs = AutoPairsDefine({"f'" : "'", "r'" : "'", "b'" : "'"})
autocmd FileType sql setlocal syntax=off
autocmd FileType json setlocal shiftwidth=2

syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=Red

" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

let g:session_autosave = 'no'
let g:session_autoload = 'no'

let g:ale_linters = {
            \ 'python': ['pyflakes', 'flake8', 'pyls', 'mypy'],
            \}

let g:ale_fixers = {
            "\ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf'],
            \}

let g:ale_hover_to_preview = 1
" let g:ale_cursor_detail = 1
" let g:ale_floating_preview = 1
" let g:ale_hover_to_floating_preview = 1
let g:ale_echo_msg_format = '%linter% %code: %%s'
let g:ale_exclude_highlights = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '    > '
let g:ale_virtualenv_dir_names = []
let g:ale_lint_on_text_changed = 'never'

let g:ale_python_flake8_options = '--config=$HOME/.config/flake8'

let g:ale_fix_on_save = 1

let g:BufKillActionWhenBufferDisplayedInAnotherWindow = 'kill'

" autocmd WinLeave * call coc#util#clear_pos_matches('^HighlightedyankRegion')

" map <Leader>f :call coc#util#float_hide()<cr>

function! AleFixAllImports()
  let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf', 'autoimport', 'isort', 'reorder-python-imports'],
            \}
  ALEFix

  let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['yapf', 'autoflake'],
            \}
endfunction


function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" :OR organizes imports
command! -nargs=0 OR  :call AleFixAllImports()

if !empty($LOCALVIMRC)
    source $LOCALVIMRC
endif


let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

colorscheme solarized-high
" colorscheme bogster
set background=dark


lua << EOF
require("indent_blankline").setup {
    char = "¦",
    space_char_blankline = " ",
    show_current_context = true,
    show_first_indent_level = false,
    show_trailing_blankline_indent = false,
}
EOF


lua << END
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'solarized_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff',
                  {'diagnostics', sources={'nvim_diagnostic', 'coc'}}},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {'branch'},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  extensions = {}
}
END
