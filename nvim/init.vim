set hidden
set clipboard+=unnamedplus
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000
set number
set relativenumber
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set foldlevel=20

" leader key
nnoremap <space> <nop>
let mapleader = "\<space>"

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    " themes
    Plug 'dracula/vim'

    " windows
    Plug 'simeji/winresizer'

    " fzf
    Plug 'junegunn/fzf.vim'

    " utils
    Plug 'moll/vim-bbye'            " close buffers without exiting vim
    Plug 'simnalamburt/vim-mundo'   " undo tree

    " tmux
    Plug 'wellle/tmux-complete.vim'
    Plug 'christoomey/vim-tmux-navigator'
    " TODO: vim-tmux
    " TODO: vim-tmux-foxus-events

    " lsp
    Plug 'neovim/nvim-lspconfig'

    " snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " distraction free mode
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

    " indentation markers
    Plug 'Yggdroot/indentLine'

    " future plugin ideas
    " TODO: file brower: nerd-tree or rancher?
    " TODO: linter: neomake or ale?
    " TODO: surround plugin: vim-sandwich or vim-surround?
    " TODO: navigation: vim-snipe or vim-easymotion?
    " TODO: text-objects: targets.vim?
    " TODO: yank history: nvim-miniyank?
    " TODO: search and replace: ferret or quickfix_reflector?
    " TODO: status bar: lightline or vim-airline?
    " TODO: color scheme: gruvbox or dracula?
    " TODO: man pages: superman?
    " TODO: git: vim-fugitive, vim-gitgutter, git-messager or gv?
    " TODO: comments: vim-commentarty?
    " TODO: highlight yank: vim-highlighedyank
    " TODO: splitjoin.vim - join or split args/arrays on multiple lines

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " file specific
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " csv
    Plug 'chrisbra/csv.vim'  

    " json
    Plug 'elzr/vim-json'

    " markdown
    Plug 'godlygeek/tabular' 
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-pandoc/vim-pandoc-syntax' " improved conceal over vim-markdown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

    " yaml
    Plug 'pedrohdz/vim-yaml-folds'

call plug#end()

" theme
colorscheme dracula

" win resizer
let g:winresizer_start_key = "<leader>w"

" csv config
autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
autocmd BufWritePre *.csv %UnArrangeColum

" dont use arrow keys in vim!
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" tabs
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tn :tabnew<CR>
nnoremap tc :tabclose<CR>

" indentation marker
let g:indentLine_char = ''

" split with ctrl-w h instead of ctrl-w s
nnoremap <c-w>h <c-w>s

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" markdown
let g:vim_markdown_folding_disabled = 1 " disables header folding
let g:vim_markdown_conceal = 0          " disables conceal feature
let g:tex_conceal = ""                  " disables tex conceal feature
let g:vim_markdown_math = 1

let g:vim_markdown_frontmatter = 1      " enable yaml frontmatter
let g:vim_markdown_toml_frontmatter = 1 " enable toml frontmatter
let g:vim_markdown_json_frontmatter = 1 " enable json frontmatter

augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END

let g:mkdp_auto_close = 0               " dont autoclose markdown previw
nnoremap <C-m> :MarkdownPreview<CR>

" yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" distraction free mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" bash lsp
lua require'lspconfig'.bashls.setup{}

" python lsp
lua require'lspconfig'.pyright.setup{}
