
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
"Plug 'airblade/vim-gitgutter'
"Plug 'tpope/vim-obsession'
"Plug 'thaerkh/vim-workspace'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'flazz/vim-colorschemes'
"Plug 'kien/ctrlp.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'tpope/vim-surround'
"Plug 'w0rp/ale'
"Plug 'rust-lang/rust.vim', { 'for': 'rust' }
"Plug 'shougo/unite.vim'
"Plug 'shougo/vimfiler.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'klen/python-mode', { 'for': 'python' }
"Plug 'mbbill/undotree'
Plug 'jremmen/vim-ripgrep'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme molokai
let g:Guifont="Source Code Pro Semibold:h12"
set gfn="Source Code Pro Semibold:h12"
set noswapfile nobackup
set noerrorbells visualbell t_vb=
"set clipboard=unnamed
set laststatus=2

let mapleader = "\<Space>"

" vimrc
"nnoremap <Leader>rgr :source ~\AppData\Local\nvim\ginit.vim<CR>
nnoremap <Leader>ce :edit ~\AppData\Local\nvim\init.vim<CR>
nnoremap <Leader>cr :source ~\AppData\Local\nvim\init.vim<CR>
nnoremap <Leader>ci :source ~\AppData\Local\nvim\init.vim<CR>:PlugInstall<CR>
nnoremap <Leader>cc :PlugClean<CR>

" workspace
"let g:workspace_autocreate = 1
"let g:workspace_session_directory = $HOME . '/AppData/Local/nvim/sessions'
"nnoremap <Leader>s :ToggleWorkspace<CR>
"
" session
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
nnoremap <Leader>sn :SaveSession 
nnoremap <Leader>sN :SaveSession! 
nnoremap <Leader>ss :SaveSession 
nnoremap <Leader>sS :SaveSession! 
nnoremap <Leader>so :OpenSession 
nnoremap <Leader>sO :OpenSession! 
nnoremap <Leader>sd :DeleteSession
nnoremap <Leader>sD :DeleteSession!


" file system
nnoremap <Leader>w :write<CR>
"nnoremap <Leader>ft :NERDTreeToggle<CR>
"
"" buffers
"nnoremap <Leader>bd :bd<CR>
"nnoremap <Leader>bn :bn<CR>
"nnoremap <Leader>bp :bp<CR>
"
"" CtrlP
"nnoremap <Leader>pb :CtrlPBuffer<CR>
"nnoremap <Leader>pf :CtrlP<CR>
"
"" files
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>F :Files<CR>

"" git
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gd :Gdiff<CR>

"" Rg
nnoremap <leader>/ :Rg 
"
"" Window Management
"nnoremap <Leader>wh <C-w>H
"nnoremap <Leader>wj <C-w>J
"nnoremap <Leader>wk <C-w>K
"nnoremap <Leader>wl <C-w>L
"nnoremap <Leader>ww <C-W>w
"nnoremap <Leader>1 <C-W>1w
"nnoremap <Leader>2 <C-W>2w
"nnoremap <Leader>3 <C-W>3w
"nnoremap <Leader>4 <C-W>4w
"nnoremap <Leader>5 <C-W>5w
"nnoremap <Leader>wd :hide<CR>
"nnoremap <Leader>ws :s<CR>
"nnoremap <Leader>wv :vs<CR>
"
"" Disable Arrows
"nnoremap <Up> <Nop>
"nnoremap <Down> <Nop>
"nnoremap <Left> <Nop>
"nnoremap <Right> <Nop>
"nnoremap <PageUp> <Nop>
"nnoremap <PageDown> <Nop>
"inoremap <Up> <Nop>
"inoremap <Down> <Nop>
"inoremap <Left> <Nop>
"inoremap <Right> <Nop>
"inoremap <PageUp> <Nop>
"inoremap <PageDown> <Nop>
"vnoremap <Up> <Nop>
"vnoremap <Down> <Nop>
"vnoremap <Left> <Nop>
"vnoremap <Right> <Nop>
"vnoremap <PageUp> <Nop>
"vnoremap <PageDown> <Nop>
