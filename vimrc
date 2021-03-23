" ---                   ---
" --- vimrc config file --- 
" ---                   ---

" --- parameters --- 
syntax on
let mapleader = " "
set noerrorbells
set splitbelow
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nocompatible
filetype plugin on
set smartcase
set noswapfile
set nobackup 
set undodir=~/.vim/undodir
set undofile
set incsearch
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set showtabline=2
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
let loaded_matchparen = 1
set wildmode=longest,list,full
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 20
let g:NERDTreeShowHidden = 1
let g:goyo_width = 120
let g:gruvbox_contrast_dark = 'hard'
"autocmd VimEnter * NERDTree
"set nowrap

" --- plug in manager (vim-plug) ---
call plug#begin('~/.vim/autoload')

Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf.vim'

call plug#end()

" --- colorscheme settings --- 
set background=dark
colorscheme gruvbox

" --- keybindings ---
map cc :!
inoremap <C-H> <C-W>
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
map fj 0cw<bs><cr><esc>
map <f1> :set spell!<CR>
map <f2> :Goyo<CR>
map <f3> :UndotreeToggle<CR>
map <leader>w :write<CR>
map <leader>f :NERDTreeToggle<CR>
map <leader>c :set formatoptions-=cro<CR>
map <leader>n :tabn<CR>
map <leader>p :tabp<CR>
map <leader>t :tabnew <bar> NERDTreeToggle<CR>

" --- lightline configuration --- 
if !has('gui_running')
      set t_Co=256
  endif

set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly' ] ]
      \ },
      \ }

" --- vim close-tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.txt,*.js,'
let g:closetag_filetypes = 'html,xhtml,phtml,txt,js'

" --- diy autoclosing 
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
"inoremap " ""<left>
"inoremap ' ''<left>
