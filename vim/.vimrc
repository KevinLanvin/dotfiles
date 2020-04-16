"VIM CONFIG"

set nocompatible
let mapleader = "\<Space>"

filetype plugin indent on
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set encoding=utf-8

set wildmenu
set wildmode=longest:full,full
set laststatus=2
set nu
highlight LineNr ctermfg=DarkGrey
set foldmethod=indent

set splitright
set splitbelow

" Plugins "
call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/vim-gitgutter'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'leafoftree/vim-vue-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
call plug#end()

" Mapping "
"Move between splits"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"Resize splits"
nmap <S-h> <C-w><
nmap <S-j> <C-w>+
nmap <S-k> <C-w>-
nmap <S-l> <C-w>>

"Normal mode"
nmap <leader>n :NERDTreeTabsToggle<CR>
nnoremap ; :
"Move between tabs"
map <leader>l :tabnext<CR>
map <leader>h :tabprev<CR>

"Insert mode"
inoremap jk <ESC>
inoremap kj <ESC>

"Visual mode"
vnoremap ; :

"NERDTree options"
let g:NERDChristmasTree=1
let g:NERDTressAutoDeleteBuffer=1
let g:NERDTreeChDirMode=2
let g:NERDTreeDirArrows=0
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1
autocmd vimenter * if !argc() | let g:nerdtree_tabs_open_on_console_startup=1 | endif
nmap <F6> :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"DelimiMate options"
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 2

"Theme"
syntax enable
colorscheme tender
let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:vim_vue_plugin_use_sass = 1
hi VertSplit guifg=#aaaaaa ctermfg=245 guibg=#282828 ctermbg=235 gui=NONE cterm=NONE
highlight Visual ctermbg=0 cterm=reverse gui=none
"Highlighting trailing spaces"
highlight ExtraWhitespace term=reverse ctermbg=196
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
set listchars=tab:▸\ ,eol:¬,trail:·
