"VIM CONFIG"

set nocompatible
let mapleader = "\<Space>"

filetype plugin indent on
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
syntax on
set encoding=utf-8

set wildmenu
set wildmode=longest:full,full
set laststatus=2
set nu
highlight LineNr ctermfg=DarkGrey

set splitright
set splitbelow

" Plugins "
call plug#begin('~/.vim/plugged')
Plug 'romkatv/powerlevel10k'
Plug 'https://github.com/vim-syntastic/syntastic.git'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'Raimondi/delimitMate'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/vim-gitgutter'
call plug#end()

" Mapping "
"Move between splits"
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
"Resize splits"
nmap <S-h> <C-w>>
nmap <S-j> <C-w>+
nmap <S-k> <C-w>-
nmap <S-l> <C-w><

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

"Highlighting trailing spaces"
highlight ExtraWhitespace term=reverse ctermbg=196
au BufNewFile,BufRead * :match ExtraWhitespace /\s\+$/
:set listchars=tab:▸\ ,eol:¬,trail:·

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
let delimitMade_expand_cr = 2
let delimitMate_expand_space = 2

"Syntastic options"
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

"Gitgutter options"
let g:gitgutter_enabled=1
let g:gitgutter_override_sign_column_highlight = 0
highlight clear SignColumn
set signcolumn=yes
let g:gitgutter_highlight_lines=1
highlight GitGutterAdd ctermfg=darkgreen ctermbg=Black
highlight GitGutterChange ctermfg=yellow ctermbg=Black
highlight GitGutterChangeDelete ctermfg=yellow ctermbg=Black
highlight GitGutterDelete ctermfg=red ctermbg=Black
highlight GitGutterAddLine ctermbg=Black
highlight GitGutterChangeLine ctermbg=Black
highlight GitGutterDeleteLine ctermbg=Black
highlight GitGutterChangeDeleteLine ctermbg=Black
