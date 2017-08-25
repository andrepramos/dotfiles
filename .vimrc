    """""""""""
    " Plugins "
    """""""""""

    " Fetchs VimPlug if not already installed

    
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-rsi'
Plug 'klen/python-mode'
Plug 'farfanoide/vim-kivy'
Plug 'Valloric/YouCompleteMe'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-characterize'
Plug 'lervag/vimtex'

call plug#end()

" Enable omnicfunc
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Set the colorscheme
colorscheme hybrid
set background=dark

" Set line nubmers
set relativenumber
set number

" CtrlP default mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Change leader key
let mapleader = "\<Space>"

" Change Local Leader
let maplocalleader = "\\"

" Makes Enter sane in normal mode
nmap  ^[<CR> O<Esc>
nmap <CR> o<Esc>

" Faster save
nnoremap <Leader>w :w<CR>

" Faster system clipboardd
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Better selection expansion
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Faster quit
nnoremap <Leader>q :q<CR>

" Better window movement

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Disable annoying swp
set noswapfile
set nobackup

" Set proper tabs
set tabstop=4
set expandtab
set shiftwidth=4

" Yapf code formatter
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

" Sort python imports
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

" Auto run python
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python %"
    endif
endfunction

" Enable mouse
set mouse=a

" Highlight current line
set cursorline

" Opens nerdtree
nnoremap <Leader>nt :NERDTreeToggle<CR>

" Enbles LaTeX autocomplete in YCM

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = [
    \ 're!\\[A-Za-z]*cite[A-Za-z]*(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\[A-Za-z]*ref({[^}]*|range{([^,{}]*(}{)?))',
    \ 're!\\hyperref\[[^]]*',
    \ 're!\\includegraphics\*?(\[[^]]*\]){0,2}{[^}]*',
    \ 're!\\(include(only)?|input){[^}]*',
    \ 're!\\\a*(gls|Gls|GLS)(pl)?\a*(\s*\[[^]]*\]){0,2}\s*\{[^}]*',
    \ 're!\\includepdf(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\includestandalone(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\usepackage(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\documentclass(\s*\[[^]]*\])?\s*\{[^}]*',
    \ 're!\\[A-Za-z]*',
\ ]
