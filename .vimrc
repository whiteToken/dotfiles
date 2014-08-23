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
if has("gui_running")
    set lines=50 columns=180
    set guifont=Monospace\ 12
    set guioptions-=m
    set guioptions-=T
endif
" }}}

""{{{Completion Func and Mapping


"function! Tab_Or_Complete()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return "\<Tab>"
"    endif
"endfunction
"
":inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"
"unl aul  "just for testing
"autocmd! autoCom
"
"if !exists("aul")
"    let aul = 1
"    augroup autoCom
"        au CursorMovedI * exe "norm i\<C-N>"
"        "au BufAdd * call append(line('.'), "hello")
"    augroup END
"endif
"
"function! Aucom()
"    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"        return "\<C-N>"
"    else
"        return ""
"    endif
"endfunction

"let counter = 0
"inoremap <expr> <C-L> ListItem()
"inoremap <expr> <C-R> ListReset()
"
"func ListItem()
"  let g:counter += 1
"  return g:counter . '. '
"endfunc
"
"func ListReset()
"  let g:counter = 0
"  return ''
"endfunc

function! Tab_Or_Complete()
    "if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    if pumvisible()
        return "\<C-N>"
    else
        return "\<Tab>"
    endif
endfunction

function! CxComplete()

    if pumvisible()
        return ""
    else
        return "\<C-X>"
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

function! s:Maping()
call s:Unmap()
let s:mapletters = [
    \ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
    \ 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    \ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
    \ 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
    \ '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    \ '_' ]
    for key in s:mapletters
        "execute printf('inoremap <silent> %s %s<C-r>=<SID>feedPopup()<CR>', key, key)
        execute 'inoremap ' . key . ' ' . key . '<C-N><C-P>'
        "execute 'inoremap ' . key . ' ' . key . '<C-R>=CxComplete()<CR><C-R>=CnuComplete()<CR><C-P>'
    endfor
    "set cot=menu,preview
    inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
endfunction

function! s:Unmap()
    if !exists('s:mapletters')
        return
    endif
    for key in s:mapletters
        execute 'iunmap ' . key
    endfor
    let s:mapletters = []
endfunction

call s:Maping()
"call s:Unmap()

set conceallevel=2
set concealcursor=vin
let g:clang_snippets=1
let g:clang_conceal_snippets=1
let g:clang_snippets_engine='clang_complete'
let g:clang_complete_macros=1

" Complete options (disable preview scratch window, longest removed to aways show menu)
set completeopt=menu,menuone

" Limit popup menu height
set pumheight=20

" SuperTab completion fall-back
"let g:SuperTabDefaultCompletionType='<c-x><c-u><c-p>'

" }}}

"{{{ Mappings

nnoremap <Leader>6 ^
nnoremap <Leader>4 $

inoremap jj <Esc>

nnoremap <F4> :buffers<CR>:buffer<Space>

nnoremap <F2> :q!

nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>e :tabe ~/.vimrc<CR>

nnoremap / :set hls<CR> /
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

nnoremap <F9> :make tags<CR>
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


