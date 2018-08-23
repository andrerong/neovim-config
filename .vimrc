" File: .vimrc
" Author: Andre Rong <drnbuffer@hotmail.com>
"
" My Vim Configuration
"

" This is default set when you have a vimrc amyway
set nocompatible

" Bootstrap vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" ----- Appearance -----
Plug 'dracula/vim',{'as':'dracula'}
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'neutaaaaan/iosvkem'
Plug 'vim-airline/vim-airline-themes'

" ----- Usage -----
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'

" ----- Git -----
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" ----- Other -----
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vimwiki/vimwiki'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'bkad/CamelCaseMotion'
Plug 'scrooloose/nerdcommenter'
Plug 'skywind3000/asyncrun.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Add full file path to your existing statusline
" Just use Ctrl-G
" set statusline+=%F
" set laststatus=2

" Turn on syntax highlighting (On by default?)
syntax on

" Show line number
set number
set relativenumber
 :highlight LineNr ctermfg=lightblue ctermbg=black

" Turn tabs into spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab

" Highlight cursor line
set cursorline
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"set textwidth=79

" NERDTree open and toggle
nnoremap <silent> <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" COMP9242 build
nnoremap <silent> <Leader>b :AsyncRun cd ~/aos-2018/build/ && ninja && ../reset.sh<CR>

set cindent

" background colour
":highlight Normal ctermfg=grey ctermbg=black

" Colourscheme
colo dracula

" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1

" Show just the file name
"let g:airline#extensions#tabline#fnamemod = ':t'

" Treat _ as a word boundary
"set iskeyword-=_

call camelcasemotion#CreateMotionMappings('<leader')

" Jetpack
nnoremap <Leader>g :ls<CR>:b<space>

" Esc Esc to save file instead of :w
map <Esc><Esc> :w<CR>
