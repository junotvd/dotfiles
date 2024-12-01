call plug#begin()

" List your plugins here
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
    set conceallevel=1
    let g:tex_conceal='abdmg'
    hi Conceal ctermbg=none

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'nordtheme/vim'
Plug 'morhetz/gruvbox'

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

call plug#end()

let mapleader="\<Space>"
map <leader>pv :Ex<Cr>
map <leader>ll :VimtexCompile<Cr>

set autoindent
set smartindent

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

set number relativenumber
set scrolloff=8

set termguicolors
syntax enable
colorscheme nord
set background=dark
