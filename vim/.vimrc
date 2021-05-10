execute pathogen#infect()

"vim-ruby
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Set specific linters
let g:ale_linters = {
    \   'javascript': ['eslint'],
    \   'ruby': ['rubocop'],
    \}

" Set specific fixers
let g:ale_fixers = {
      \    'ruby': ['rubocop'],
      \}
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1 
let g:ale_fix_on_save = 1
" Disable ALE auto highlights
let g:ale_set_highlights = 0 

" key map for vim-ruby
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" Then we enable integration with vim-airline so that lint errors are shown in the status bar
let g:airline#extensions#ale#enabled = 1 
let g:ale_sign_column_always = 1

" airline setup
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

" let g:airline_solarized_bg='dark'

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
" nord-vim theme
  Plug 'arcticicestudio/nord-vim'

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
" ale- provides a linter
  Plug 'w0rp/ale'
" languageClient
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
call plug#end()

" set nord
colorscheme nord

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

"solargraph
let g:LanguageClient_serverCommands = {
    \ 'ruby': [' ~/.rvm/gems/ruby-2.7.2/bin/solargraph', 'stdio'],
    \ }

" Required for operations modifying multiple buffers like rename.
set hidden
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"vim-ruby autocomple matcher
if !exists( "*RubyEndToken" )
  function RubyEndToken()
    let current_line = getline( '.' )
    let braces_at_end = '{\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
    let stuff_without_do = '^\s*\(class\|if\|unless\|begin\|case\|for\|module\|while\|until\|def\)'
      let with_do = 'do\s*\(|\(,\|\s\|\w\)*|\s*\)\?$'
      if match(current_line, braces_at_end) >= 0
        return "\<CR>}\<C-O>O"
      elseif match(current_line, stuff_without_do) >= 0
        return "\<CR>end\<C-O>O"
      elseif match(current_line, with_do) >= 0
        return "\<CR>end\<C-O>O"
      else
        return "\<CR>"
      endif
    endfunction
endif

imap <buffer><CR> <C-R>=RubyEndToken()<CR>

