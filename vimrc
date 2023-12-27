
call plug#begin()
Plug 'tpope/vim-fugitive'
call plug#end()
silent! colorscheme molokai
let mapleader = "\<Space>"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
set mouse=a

nnoremap <Leader>re :edit ~/code/dotfiles/vimrc_nix<CR>

nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gpo :Git push -u origin HEAD<CR>
nnoremap <Leader>gP :Git pull<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gb :Git switch 
nnoremap <Leader>gB :Git checkout -b 
