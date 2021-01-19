"Basics
set number relativenumber 
set nocompatible
filetype plugin indent on
syntax on
set hidden

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let mapleader=","

"PLugin manager and plugins
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'hashivim/vim-terraform'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ekalinin/Dockerfile.vim'
Plug 'preservim/nerdcommenter'
Plug 'dylanaraps/wal'
Plug 'lervag/vimtex'
Plug 'morhetz/gruvbox'
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-snippets', 'coc-vimlsp', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier']

let g:syntastic_python_python_exec = '/usr/local/bin/python3'

Plug 'ianks/vim-tsx'

Plug 'leafgarland/typescript-vim'

Plug 'jiangmiao/auto-pairs'
call plug#end()


au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx


"NERDTree config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-e> :NERDTreeToggle<CR>


autocmd FileType python map <buffer> <F3> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F3> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

let g:gruvbox_contrast_dark = 'hard'

colorscheme wal
" colorscheme gruvbox

source $HOME/.config/nvim/plug-config/coc.vim 

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
