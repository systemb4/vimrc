"          _
"   __   _(_)_ __ ___  _ __ ___
"   \ \ / / | '_ ` _ \| '__/ __|
"    \ V /| | | | | | | | | (__
"     \_/ |_|_| |_| |_|_|  \___|

" --- parameters
syntax on
let mapleader = " "
set noerrorbells
set splitbelow
set shiftwidth=4
set smartindent
set number relativenumber
set nocompatible
set expandtab
filetype plugin on
set smartcase
set noswapfile
set nobackup 
set encoding=UTF-8
set undodir=~/.vim/undodir
set undofile
set incsearch
set wrap
set viminfo='100,n$HOME/.vim/files/info/viminfo
set showtabline=1
let loaded_matchparen = 1
set wildmode=longest,list,full
set formatoptions-=cro
set updatetime=50
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
let $PAGER=''
"hi SpellBad ctermfg=000 ctermbg=015 cterm=none guifg=#000000 guibg=#ffffff gui=none
hi TabLineFill ctermfg=DarkGray
hi TabLine ctermbg=DarkGray
set wildmode=longest,list,full
autocmd InsertEnter,InsertLeave * set cursorline!
autocmd InsertEnter,InsertLeave * set cursorcolumn!
let &t_SI = "\e[6 q"
let &t_EI = "\e[1 q"

" search for '.vim.custom' in a directory for vim configuratins specific to that directory
if filereadable(".vim.custom")
    so .vim.custom
endif

if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif

" --- plug in manager (vim-plug)
call plug#begin('~/.vim/autoload')

Plug 'mbbill/undotree'
Plug 'alvan/vim-closetag'
Plug 'ap/vim-css-color'
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'vim-scripts/AutoComplPop'
Plug 'flazz/vim-colorschemes'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" --- keybindings
map cc :!
inoremap <C-H> <C-W>
map gw g<C-g>
map fj 0cw<bs><cr><esc>
map <f1> :set spell!<CR>
map <f2> :UndotreeToggle<CR>
map <leader>. :NERDTreeToggle<CR>
map <leader>t :tabe<CR>
map <leader>p :tabp<CR>
map <leader>n :tabn<CR>
map <leader>w :Windows<CR>
map <leader>c <plug>NERDCommenterToggle
noremap <leader>h :wincmd h<CR>
noremap <leader>j :wincmd j<CR>
noremap <leader>k :wincmd k<CR>
noremap <leader>l :wincmd l<CR>
noremap <leader>[ :wincmd <<CR>
noremap <leader>] :wincmd ><CR>

" --- lightline configuration
if !has('gui_running')
      set t_Co=256
  endif

set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
	  \   'left': [ [ 'mode', 'paste' ],
	  \             [ 'absolutepath', 'modified', 'readonly' ] ]
      \ },
      \	'mode_map': {
	  \ 'n': 'NORMAL',
	  \ 'i': 'INSERT',
	  \ 'R': 'REPLACE',
	  \ 'v': 'VISUAL',
	  \ 'c': 'COMMAND'
      \ },
      \ }

" --- Nerd Tree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 30
let g:NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"autocmd VimEnter * NERDTree | wincmd p | call lightline#update()

" --- startify
let g:startify_change_to_dir = 1
let g:startify_padding_left = 10
let g:startify_disable_at_vimenter = 1
let g:startify_files_number = 10
autocmd User Startified setlocal cursorline

let g:startify_commands = [
        \ {'f': ['File Manager', 'NERDTreeToggle']},
        \ {'s': ['Fuzzy Search', 'Files $HOME']},
        \ {'t': ['Terminal', 'term']},
        \ {'a': ['Command History', 'History:']}
        \ ]

let g:startify_bookmarks = [ 
	    \ {'o': '~/doc/todo.md'}, 
	    \ {'c': '~/.vim/vimrc'}, 
	    \ {'z': '~/.config/zsh/.zshrc'}, 
	    \ {'u': '~/.config/newsboat/urls'},
	    \ ]

let g:ascii = [
	    \ '       _',
	    \ '__   _(_)_ __ ___',
	    \ '\ \ / / | - _ ` _ \',
	    \ ' \ V /| | | | | | |',
	    \ '  \_/ |_|_| |_| |_|',
	    \ ''
	    \ ]

let g:startify_custom_header = g:ascii
let g:startify_custom_header =
	    \ startify#pad(g:ascii)
let g:startify_custom_header =
	    \ 'startify#center(g:ascii)'

" opens startify in all new tabs
if has('nvim')
    autocmd TabNewEntered * Startify
else
    autocmd BufWinEnter *
		\ if !exists('t:startify_new_tab')
		\     && empty(expand('%'))
		\     && empty(&l:buftype)
		\     && &l:modifiable |
		\   let t:startify_new_tab = 1 |
		\   Startify |
		\ endif
endif

" --- vim close-tag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.txt,*.js,'
let g:closetag_filetypes = 'html,xhtml,phtml,txt,js'

" colorscheme
set background=dark
colorscheme jellybeans
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE 
autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

" --- diy autoclosing 
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
