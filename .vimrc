set number	
set linebreak	
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell	
 
set hlsearch	
set smartcase
set ignorecase
set incsearch
 
set autoindent
set cindent
set expandtab
set shiftwidth=4
set smartindent	
set smarttab
set softtabstop=4
syntax on
 
set ruler	
 
set undolevels=1000
set backspace=indent,eol,start	
set rtp+=~/.vim/vimrc

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
