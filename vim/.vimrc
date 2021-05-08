syntax on
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

" indentLine setup
let g:indentLine_color_term = 239 

" coc suggestions
let g:coc_disable_startup_warning = 1

" gitgutter
highlight SignColumn      guibg=#252e32 ctermbg=2
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
highlight clear SignColumn
highligh ColorColumn ctermbg=0 guibg=lightgrey

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
" coc-nvim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc.nvim', { 'branch': 'master', 'do': 'yarn install --frozen-lockfile' }
" fzf
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

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

" buffers
nnoremap <leader>b :ls<CR>:b<Space>
map <C-K> :bnext<CR>
map <C-J> :bprev<CR>

