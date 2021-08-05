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
    Plug 'christoomey/vim-tmux-navigator'

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
