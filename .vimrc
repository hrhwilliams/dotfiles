syntax on
set nocompatible
set spelllang=en
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
" Plugin 'valloric/youcompleteme'
Plugin 'myusuf3/numbers.vim'
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" NERDTree
map <C-n> :NERDTreeToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree

" Additional C++ syntax highlights
autocmd FileType cpp syn keyword Statement std
autocmd FileType cpp syn keyword Type string

" New file templates
autocmd BufNewFile *.h r $HOME/.vim/templates/header
autocmd BufNewFile *.hpp r $HOME/.vim/templates/header
autocmd BufNewFile *.tex r $HOME/.vim/templates/tex

" Vim latex live preview
let g:livepreview_previewer = 'zathura'
autocmd FileType tex LLPStartPreview
:set updatetime=500

" Tabbing
set tabstop=2
set shiftwidth=2
