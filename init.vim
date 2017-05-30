
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Plug 'shougo/unite.vim'
"Plug 'shougo/vimfiler.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode', { 'for': 'python' }
call plug#end()

colorscheme molokai
let g:Guifont="Source Code Pro Semibold:h12"
set gfn="Source Code Pro Semibold:h12"
set noswapfile nobackup
set noerrorbells visualbell t_vb=
set clipboard=unnamed
set laststatus=2

let mapleader = "\<Space>"

" vimrc
nnoremap <Leader>rge :edit ~\AppData\Local\nvim\ginit.vim<CR>
nnoremap <Leader>rgr :source ~\AppData\Local\nvim\ginit.vim<CR>
nnoremap <Leader>re :edit ~\AppData\Local\nvim\init.vim<CR>
nnoremap <Leader>rr :source ~\AppData\Local\nvim\init.vim<CR>
nnoremap <Leader>pi :source ~\AppData\Local\nvim\init.vim<CR>:PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>

" file system
nnoremap <Leader>fs :write<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>

" buffers
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" CtrlP
nnoremap <Leader>pb :CtrlPBuffer<CR>
nnoremap <Leader>pf :CtrlP<CR>

" git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>

" Window Management
nnoremap <Leader>wh <C-w>H
nnoremap <Leader>wj <C-w>J
nnoremap <Leader>wk <C-w>K
nnoremap <Leader>wl <C-w>L
nnoremap <Leader>ww <C-W>w
nnoremap <Leader>1 <C-W>1w
nnoremap <Leader>2 <C-W>2w
nnoremap <Leader>3 <C-W>3w
nnoremap <Leader>4 <C-W>4w
nnoremap <Leader>5 <C-W>5w
nnoremap <Leader>wd :hide<CR>
nnoremap <Leader>ws :s<CR>
nnoremap <Leader>wv :vs<CR>

" Disable Arrows
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <PageUp> <Nop>
nnoremap <PageDown> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
vnoremap <Up> <Nop>
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <PageUp> <Nop>
vnoremap <PageDown> <Nop>
