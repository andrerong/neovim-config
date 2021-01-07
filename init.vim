"
" File: init.vim
" Author: Andre Rong <andrerong23@gmail.com>
"
" My Neovim Configuration
"

" Reminder: If using this vim configuration for the first time, you'll need to
" install plug.vim (vim-plug).


call plug#begin()
    " ----- Appearance -----
    Plug 'gruvbox-community/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'andrerong/vim-airline-clock' " My fork to remove leading space

    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'Yggdroot/indentLine'

    " ----- NERDTree -----
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'ryanoasis/vim-devicons'

    " ----- Usage -----
    Plug 'tpope/vim-sensible'
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'kana/vim-textobj-user'
    Plug 'kana/vim-textobj-entire' " Requires the above
    Plug 'tommcdo/vim-exchange'
    Plug 'vim-scripts/argtextobj.vim'
    Plug 'moll/vim-bbye' " Bdelete (bdelete but keep window)
    Plug 'preservim/tagbar'
    Plug 'wellle/targets.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " ----- Git -----
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " ----- Other -----
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'Raimondi/delimitMate'
    Plug 'junegunn/goyo.vim'
    Plug 'mattn/calendar-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'psliwka/vim-smoothie'
    Plug 'vim-scripts/ReplaceWithRegister'
    Plug 'antoinemadec/FixCursorHold.nvim' " Not sure if useful

    " ------ Web ------
    Plug 'turbio/bracey.vim'
    Plug 'mattn/emmet-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'peitalin/vim-jsx-typescript'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'jparise/vim-graphql'

call plug#end()



" ------------------------------------------------------------------------
" Begin
" ------------------------------------------------------------------------
syntax on

" Turn tabs into spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smarttab

set cindent autoindent
filetype indent off

set nowritebackup noswapfile nobackup

" ------------------------------------------------------------------------

" Space as leader key
nnoremap <SPACE> <Nop>
let mapleader=" "

" Show line number
set number relativenumber cursorline

" Copy/paste system clipboard
set clipboard+=unnamedplus


" NERDTree open and toggle
nnoremap <silent> <Leader>f :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

"
" Move contiguous lines of code up or down
"

" " Normal mode
nnoremap <silent> <C-j> :m .+1<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==
" " Insert mode
inoremap <silent> <C-j> <ESC>:m .+1<CR>==gi
inoremap <silent> <C-k> <ESC>:m .-2<CR>==gi
" " Visual mode
vnoremap <silent> <C-j> :m '>+1<CR>gv=gv
vnoremap <silent> <C-k> :m '<-2<CR>gv=gv

colo gruvbox

iabbrev date- <C-r>=strftime("%Y/%m/%d %H:%M:%S")<CR>

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

set mouse=a
set splitright splitbelow

" Compilation command
" nnoremap <leader>c :!co %:r<CR>
" nnoremap <leader>r :!run %:r<CR>
" nnoremap <leader>r :!co %:r && ./%:r && rm %:r;<CR>

" Terminal Escape to Normal Mode
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <Leader>t :15sp \| te<CR>i

" Allows you to leave buffers unsaved when you go to a different buffer
set hidden
nnoremap gb :ls<CR>:b<Space>

" Disable Ex Mode: The key that gets hit by accident
nnoremap Q <Nop>

" No word wrap
set nowrap

" Get rid of highlighting after a search
nnoremap <silent> <CR> :noh<CR>

" Go to insert mode when clicking on terminal window
augroup terminal_setup | au!
    autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
augroup end

" Insert mode on entering a window in terminal mode
autocmd BufWinEnter,WinEnter term://* startinsert

" Window resizing with arrow keys
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
" inoremap <Up> <ESC>:resize +2<CR>li

" FZF
nnoremap <silent> <Leader><Space> :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> gB :Buffers<CR>
nnoremap <silent> <Leader>g :GFiles?

" let g:fzf_commits_log_options = '--graph --color=always
"   \ --format="%C(yellow)%h%C(red)%d%C(reset)
"   \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

" nnoremap <silent> <Leader>c  :Commits<CR>
" nnoremap <silent> <Leader>bc :BCommits<CR>

nnoremap <Leader>rg :Rg<Space>
nnoremap <Leader>RG :Rg!<Space>

" Ignorecase for searches
set ignorecase smartcase

" Cleaner status line
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
" let g:airline_section_warning = ''
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#clock#format = '%A, %-d %B %-I:%M %p'

" Disable auto scroll when typing in insert mode
set nofoldenable

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
