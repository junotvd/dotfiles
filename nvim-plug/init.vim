call plug#begin()

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_latexmk_engines = {'_': '-lualatex -shell-escape'}

" Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=2
" let g:tex_conceal='abdmg'
" let g:tex_conceal_frac=1
" hi Conceal ctermbg=none

Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'nordtheme/vim'
Plug 'lunacookies/vim-colors-xcode'

Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot'

Plug 'kaarmu/typst.vim'

call plug#end()

let mapleader="\<Space>"

map <leader>pv :Ex<Cr>
map <leader>ll :VimtexCompile<Cr>
map <leader>lv :VimtexView<Cr>

inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
vnoremap <leader>y "+y
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>


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
