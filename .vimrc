"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       ▒█                                                "
"                                                         "
"  ▒█▒█▒██ ▒██▒█ ▒███▒██                                  "
"  ▒█▒█ ▒█ ▒█▒█▒█▒█ ▒█                                    "
"   ▒█  ▒██▒█▒█▒█▒█  ▒██                                  "
"                                                         "
" .vimrc   -   /vim/ noun, definition: energy; enthusiasm "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax on
set spelllang=en

" Relative Numbers
set nocompatible
filetype plugin on
set encoding=utf-8
set number relativenumber

" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2

" UI
set showcmd
set wildmenu
set lazyredraw
set showmatch

nnoremap j gj
nnoremap k gk

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'junegunn/goyo.vim'
Plug '~/.fzf' " junegunn/fzf
Plug 'xuhdev/vim-latex-live-preview'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" NERDTree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" New file templates
autocmd BufNewFile *.h r $HOME/.vim/templates/header
autocmd BufNewFile *.hpp r $HOME/.vim/templates/header
autocmd BufNewFile *.tex r $HOME/.vim/templates/tex

" Vim latex live preview
let g:livepreview_previewer = 'zathura'
autocmd FileType tex LLPStartPreview
:set updatetime=500
