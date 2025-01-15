call plug#begin()

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
let g:tex_conceal='abdmg'
let g:tex_conceal_frac=1
hi Conceal ctermbg=none

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'yankcrime/direwolf'
Plug 'nordtheme/vim'
Plug 'lunacookies/vim-colors-xcode'

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

call plug#end()

let mapleader="\<Space>"

map <leader>pv :Ex<Cr>
map <leader>ll :VimtexCompile<Cr>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



set nocompatible

setlocal spell
set spelllang=nl
"set spelllang=nl,en_gb

set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set number relativenumber
set scrolloff=8

set termguicolors
syntax enable
set background=dark
colorscheme nord
