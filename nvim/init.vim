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

" leader key
nnoremap <space> <nop>
let mapleader = "\<space>"

call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    " windows
    Plug 'simeji/winresizer'

    " fzf
    Plug 'junegunn/fzf.vim'

    " utils
    Plug 'moll/vim-bbye' " close buffers without exitting vim
    Plug 'simnalamburt/vim-mundo' " undo tree

    " tmux
    Plug 'wellle/tmux-complete.vim'
    Plug 'christoomey/vim-tmux-navigator'
    " TODO: vim-tmux
    " TODO: vim-tmux-foxus-events

    " lsp
    Plug 'neovim/nvim-lspconfig'

    " future plugin ideas
    " TODO: snippets: vim-snippets or ultisnips? 
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

    " file specific
    Plug 'chrisbra/csv.vim'  
call plug#end()

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

" split with ctrl-w h instead of ctrl-w s
nnoremap <c-w>h <c-w>s

" bash lsp
lua require'lspconfig'.bashls.setup{}

" python lsp
lua require'lspconfig'.pyright.setup{}

