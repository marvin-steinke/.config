" leader
let mapleader="\<space>"
let maplocalleader="\<space>"

" plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lervag/vimtex'
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'mfussenegger/nvim-jdtls'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require'jdtls_setup'.setup()
augroup end

" general settings
set termguicolors
set number
syntax on
set hidden
set incsearch
set nospell
set fileformats=unix,dos,mac
set ignorecase
set smartcase
set undofile
set history=500
set autoread
au CursorHold * checktime
filetype plugin indent on
set expandtab
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
silent! set breakindent
set confirm
set backup
set splitbelow splitright
set wrap linebreak nolist
set signcolumn=yes
set scrolloff=10
set wildmenu
set backupdir=$HOME/.cache/vim/backup/
set nohlsearch
set clipboard=unnamed,unnamedplus

" lua
lua require('init')

" remaps
nnoremap <leader>w :w<CR>
nnoremap <silent> <leader>e :w<CR>:e<CR>
nnoremap <leader>q <C-W>q
nnoremap <silent> <C-s> :vsplit<CR>
let g:fzf_action = {'ctrl-s':'vsplit'}
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-a> :Files ~<CR>
nnoremap x "_x
nnoremap X "_x
imap <C-r> <C-r>+
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap gq{ {V}gq2<C-o>
nnoremap gq} {V}gq2<C-o>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" brackets
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap " ""<ESC>i

" tex
autocmd BufNewFile,BufRead *.lco setlocal filetype=tex
let g:tex_flavor = "latex"
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
\}
let g:vimtex_context_pdf_viewer='zathura'
let g:Tex_DefaultTargetFormat='pdf'
let g:vimtex_view_enabled=1
let g:vimtex_view_automatic=1
let g:vimtex_view_general_viewer='zathura'

" gruvbox
let g:gruvbox_italic=1
let g:gruvbox_sign_column="bg0"
let g:gruvbox_color_column="bg0"
let g:gruvbox_contrast_dark="hard"
set background=dark
silent! colorscheme gruvbox

" air-line
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'
