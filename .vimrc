"{{{Misc Settings

" Necesary  for lots of cool vim things
set nocompatible

" Folding Stuffs
set foldmethod=marker

" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable

" Who doesn't like autoindent?
set autoindent

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4

" Use english for spellchecking, but don't spellcheck by default
if version >= 700
   set spl=en spell
   set nospell
endif

" Real men use gcc
"compiler gcc

" Got backspace?
set backspace=2

" Line Numbers PWN!
set number

set hidden
"nnoremap JJJJ <Nop>

" Incremental searching is sexy
"set incsearch

" Highlight things that we find with the search
"set hls

" }}}

""{{{Look and Feel
color mustang
" }}}

"{{{ Mappings

inoremap jj <Esc>

nnoremap <F5> :buffers<CR>:buffer<Space>

nnoremap <F3> :w<CR>
nnoremap <F2> :q!
nnoremap <F1> :wa<CR>

nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>e :tabe ~/.vimrc<CR>

nnoremap / :set hls<CR> /
nnoremap <F4> :set nohls<CR>

nnoremap gb gT
nnoremap <C-t> :tabnew<CR>

nnoremap <Space> za

" insert single char
nnoremap <C-i> i_<Esc>r

nnoremap ; :
nnoremap : ;

" window managment remapings

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>c

" c make comands

nnoremap <F8> :cn<CR>
nnoremap <F7> :cp<CR>

" tab movement

nnoremap <Left> gT
nnoremap <Right> gt

" move lines

nnoremap <Up> ddkP
nnoremap <Down> ddp

" quick surroundings

inoremap <Leader>' ''<Esc>i
inoremap <Leader>" ""<Esc>i
inoremap <Leader>( ()<Esc>i
inoremap <Leader>[ []<Esc>i
inoremap <Leader>{ {}<Esc>i
inoremap <Leader>< <><Esc>i

"}}}

"{{{ Plugin stuff (with mappings)

execute pathogen#infect()

"NERDTree stuff
nnoremap <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeWinSize = 40

"airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
set ttm=50

"}}}

filetype plugin indent on
syntax on

"snipMate ("paste snippets of code based off a keyword, reduces boilerplate code)
"OmniCppComplete ('Intellisense')
"supertab (for determining what completion to use given the current cursor context)
