syntax on
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

set splitbelow
set splitright

set colorcolumn=101

set noerrorbells
set autoindent
set smartindent
set number
set nowrap
set smartcase
set noswapfile

highligh ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
  Plug 'mbbill/undotree'
  Plug 'tpope/vim-fugitive'
  Plug 'git@github.com:kien/ctrlp.vim.git'
  Plug 'preservim/nerdtree'
" snippets for ruby
  let g:deoplete#enable_at_startup = 1
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
" airline
  Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()


" set background=dark #

nnoremap <F5> :UndotreeToggle<CR>
inoremap jk <ESC>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>t :UndotreeShow<CR>
" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" ruby snippets mappings:
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
map <C-k>     <Plug>(neosnippet_expand_target)

