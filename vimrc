" --- parameters --- 
syntax on
let mapleader = " "
set noerrorbells
set splitbelow
set shiftwidth=4
set smartindent
set number relativenumber
set nocompatible
filetype plugin on
set nowrap
set smartcase
set noswapfile
set nobackup 
set undodir=~/.vim/undodir
set undofile
set incsearch
set viminfo+='1000,n$XDG_DATA_HOME/vim/viminfo
set showtabline=1
let loaded_matchparen = 1
set wildmode=longest,list,full
hi SpellBad ctermfg=000 ctermbg=015 cterm=none guifg=#000000 guibg=#ffffff gui=none
hi TabLineFill ctermfg=DarkGray
hi TabLine ctermbg=DarkGray

" --- plug in manager (vim-plug) ---
call plug#begin('~/.vim/autoload')

Plug 'mbbill/undotree'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf.vim'

call plug#end()

" --- keybindings ---
map cc :!
inoremap <C-H> <C-W>
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
map gw g<C-g>
map fj 0cw<bs><cr><esc>
map <f1> :set spell!<CR>
map <f2> :UndotreeToggle<CR>
map <leader>c :set formatoptions-=cro<CR>
map <leader>t :tabnew <bar> Files<CR>

" --- vim close-tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.txt,*.js,'
let g:closetag_filetypes = 'html,xhtml,phtml,txt,js'

" --- diy autoclosing 
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
