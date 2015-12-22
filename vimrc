"{{{Misc Settings

" Necesary  for lots of cool Vim things
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

set autoread
"nnoremap JJJJ <Nop>

" Incremental searching is sexy
"set incsearch

" Highlight things that we find with the search
"set hls

" }}}

""{{{Look and Feel
color mustang
if has("gui_running")
    set lines=50 columns=180
    set guifont=Monospace\ 12
    set guioptions-=m
    set guioptions-=T
endif
" }}}

""{{{Completion Func and Mapping

function! Tab_Or_Complete()
    "if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    if pumvisible()
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

let s:fileType='.*\.\(cpp\|cu\|c\|h\)'

function! CnuComplete()

    if empty(matchstr(bufname('%'), s:fileType))
        return "\<C-N>"
    else
        return "\<C-U>"
    endif

endfunction

function! Maping(completion, buffer)
let s:mapletters = [
    \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    \ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    \ '_', ':', ]
    for key in s:mapletters
        execute 'inoremap ' . a:buffer . key . ' ' . key . a:completion
    endfor
    "inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
    inoremap <expr> <Tab>   pumvisible() ? "\<C-N>" : "\<Tab>"
    inoremap <expr> <Down>  pumvisible() ? "\<C-N>" : "\<Down>"
    inoremap <expr> <Up>    pumvisible() ? "\<C-P>" : "\<Up>"
endfunction

function! Unmap()
    if !exists('s:mapletters')
        return
    endif
    for key in s:mapletters
        execute 'iunmap ' . key
    endfor
    let s:mapletters = []
endfunction

call Maping('<C-N><C-P>', '')
"call s:Unmap()

set completeopt=menuone,preview,noselect,noinsert

set pumheight=20

" }}}

"{{{Rust Racer
let g:racer_cmd="~/.vim/racer/target/release/racer"
let $RUST_SRC_PATH="/home/chris/gl/rust/src/"

" map rust file buffers only with rust omni complete
au BufRead *.rs call Maping('<C-X><C-O>', '<buffer>')

"}}}

"{{{  C++ code editing functions

" open cpp and h file for a class in verticle windows

" cant get this to work because find in the function reads everything literaly
function! OpenFile()

    let s:f = expand("%:t:r.h")
    vs
    e tmp
    echo s:f

endfunction

"nnoremap ,h :call OpenFile()<CR>
nnoremap ,h :vs<CR>:find %:t:r.h<CR>

"}}}

"{{{ GLSL Shader syntax highlight

au BufEnter *.fs set ft=c
au BufEnter *.vs set ft=c
au BufEnter *.fs set syntax=c
au BufEnter *.vs set syntax=c

"au BufRead s:setGLSLsyntax()

""}}}

"{{{ Mappings

nnoremap g] :tab tselect <C-r><C-w><CR>

vnoremap <Leader>q :g//exe 'norm @a'<CR>
nnoremap <Leader>q :g//exe 'norm @a'<CR>

nnoremap <Leader>d :%s/\s\+$//<CR>

nnoremap <Leader><F5> :set spell<CR>
nnoremap <Leader><F6> :set nospell<CR>

nnoremap <Leader>6 ^
nnoremap <Leader>4 $

inoremap jj <Esc>
"inoremap <C-j> <Esc>
inoremap <C-BS> <C-w>

nnoremap dl ^d$
"nnoremap --

nnoremap <F4> :buffers<CR>:buffer<Space>

nnoremap <F2> :q!

nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>e :tabe ~/.vimrc<CR>

vnoremap <Leader>v <C-v>I

nnoremap / :set hls<CR>/
nnoremap * :set hls<CR>*
nnoremap <F3> :set nohls<CR>

nnoremap gb gT
nnoremap <Leader>t :tabnew<CR>

nnoremap <Space> za

" insert single char
nnoremap <C-i> i_<Esc>r

nnoremap ; :
nnoremap : ;

" window managment remapings

"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l
"nnoremap <C-x> <C-w>c

" c make comands

nnoremap <F9> :!ctags -R *<CR>
nnoremap <F8> :make run<CR>
nnoremap <F7> :wa<CR>:make<CR>
nnoremap <F6> :cn<CR>
nnoremap <F5> :cp<CR>

" tab movement

nnoremap <Left> gT
nnoremap <Right> gt

" move lines

"nnoremap <Up> ddkP
"nnoremap <Down> ddp

" quick surroundings

"inoremap <Leader>' ''<Esc>i
"inoremap <Leader>" ""<Esc>i
"inoremap <Leader>( ()<Esc>i
"inoremap <Leader>[ []<Esc>i
"inoremap <Leader>{ {}<Esc>i
"inoremap <Leader>< <><Esc>i

"}}}

"{{{ Plugin stuff (with mappings)
"
" let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

execute pathogen#infect()

"NERDTree stuff
"nnoremap <C-n> :NERDTreeToggle<CR>
"let g:NERDTreeWinSize = 40

"airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
set ttm=50

"}}}

"{{{ Junk stuff
filetype plugin indent on
syntax on

"snipMate ("paste snippets of code based off a keyword, reduces boilerplate code)
"OmniCppComplete ('Intellisense')
"supertab (for determining what completion to use given the current cursor context)
"
"not related to vim but this is good
"http://xexpanderx.deviantart.com/journal/The-Witcher-2-Enhanced-Edition-GOG-on-GNU-Linux-306747442
"
"this is cool map * /\<<C-R>=expand('<cword>')<CR>\><CR>





"[
"    \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
"    \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
"    \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
"    \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
"    \ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
"    \ '-', '_', '~', '^', '.', ',', ':', '!', '#', '=', '%', '$', '@', '<', '>', '/', '',
"    \ '<Space>', '<C-h>', '<BS>', ]
"

"" Complete options (disable preview scratch window)
"set completeopt=menu,menuone,longest
"" Limit popup menu height
"set pumheight=15
"
"" SuperTab option for context aware completion
"let g:SuperTabDefaultCompletionType = "context"
"
"" Disable auto popup, use <Tab> to autocomplete
"let g:clang_complete_auto = 1
"" Show clang errors in the quickfix window
"let g:clang_complete_copen = 1
"
""###################################
"}}}

