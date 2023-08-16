au BufNewFile,BufRead *.dat setf nastran
au FileType nastran setlocal tabstop=8 expandtab shiftwidth=8 softtabstop=8
" filetypes
set rtp+=/usr/share/vim/addons
"execute pathogen#infect()
source ~/dev/dotfiles/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('bundle/{}', '~/dev/dotfiles/bundle/{}')
syntax on
filetype plugin indent on

" ~/.vimrc ends here
set nocompatible
set mouse=a
set modeline
set modelines=1
syntax enable
"let g:solarized_termcolors=256
"colorscheme solarized
colorscheme desert
set background=dark
set t_Co=256

set foldmethod=syntax

set nobackup
set noswapfile

set number
set laststatus=2
set hidden
set showcmd

set tabstop=4
set softtabstop=4
set shiftwidth=4
set ai
set si
"set wrap linebreak textwidth=0
set tw=0

"set hlsearch
set incsearch
"set ignorecase
set smartcase

set backspace=indent,eol,start
"set clipboard=unnamed
set clipboard=unnamedplus

au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletiion="context"
"set completeopt=menuone,longest,preview

nmap <Tab> v>
nmap <S-Tab> v<
vmap <Tab> >gv
vmap <S-Tab> <gv

"set wildignore+=*/Results/*

"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"
"let g:Tex_MultipleCompileFormats = "pdf"
"let g:Tex_DefaultTargetFormat='pdf'
"let g:Imap_UsePlaceHolders = 0
"let g:Imap_FreezeImap = 1
"set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after,~/.vim/bundle/ctrlp.vim
"
let g:netrw_dirhistmax = 0
