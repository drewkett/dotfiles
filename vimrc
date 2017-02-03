
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode', { 'for': 'python' }
call plug#end()

colorscheme molokai
if has("gui_macvim")
	set gfn=Menlo:h13
else
	set gfn=Consolas:h11:cANSI
endif
set noswapfile nobackup
set noerrorbells visualbell t_vb=
set clipboard=unnamed
set laststatus=2
filetype plugin on

let mapleader = "\<Space>"

"python
autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>

" vimrc
nnoremap <Leader>re :edit ~\.vimrc<CR>
nnoremap <Leader>rr :source ~\.vimrc<CR>
nnoremap <Leader>pi :source ~\.vimrc<CR>:PlugInstall<CR>
nnoremap <Leader>pc :PlugClean<CR>

" word wrapping
nnoremap <Leader>tw :set wrap!<CR>

" directory
nnoremap <Leader>dc :cd %:h<CR>
nnoremap <Leader>dh :cd<CR>
nnoremap <Leader>dl :cd -<CR>

" commenting
nnoremap <Leader>; :call NERDComment(0,"toggle")<CR>
vnoremap <Leader>; :call NERDComment(0,"toggle")<CR>

" file system
nnoremap <Leader>ff :e 
nnoremap <Leader>fs :write<CR>
nnoremap <Leader>ft :NERDTreeToggle<CR>

" buffers
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>

" CtrlP
nnoremap <Leader>pb :CtrlPBuffer<CR>
nnoremap <Leader>pf :CtrlP<CR>
nnoremap <Leader>pr :CtrlPMRU<CR>

" git
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gf :Gfetch<CR>
nnoremap <Leader>gF :Gpull<CR>

" Window Management
nnoremap <Leader>wh <C-w>H
nnoremap <Leader>wj <C-w>J
nnoremap <Leader>wk <C-w>K
nnoremap <Leader>wl <C-w>L
nnoremap <Leader>ww <C-W>w
nnoremap <Leader>w= <C-W>=
nnoremap <Leader>1 <C-W>1w
nnoremap <Leader>2 <C-W>2w
nnoremap <Leader>3 <C-W>3w
nnoremap <Leader>4 <C-W>4w
nnoremap <Leader>5 <C-W>5w
nnoremap <Leader>wd :hide<CR>
nnoremap <Leader>ws :s<CR>
nnoremap <Leader>wv :vs<CR>

" Movement
nnoremap <Leader>d <C-d>
nnoremap <Leader>u <C-u>
nnoremap <Tab> >>
nnoremap <S-Tab> <<
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
inoremap <Tab> <C-t>
inoremap <S-Tab> <C-d>

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
