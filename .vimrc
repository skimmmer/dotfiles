set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" * alternative : vim-plug

" Vundle Plugin-manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle plugin (required)
Plugin 'gmarik/Vundle.vim'
" Auto-completion for C
"Plugin 'Valloric/YouCompleteMe'
" Tab completion
Plugin 'ervandew/supertab'
" Molokai colorscheme
Plugin 'tomasr/molokai'
" Wombat colorscheme
Plugin 'sheerun/vim-wombat-scheme'
" Airline
Plugin 'bling/vim-airline'
" Systemverilog
"Plugin 'WeiChungWu/vim-SystemVerilog'
"" Systemverilog
Plugin 'vhda/verilog_systemverilog.vim'
" Alignment
Plugin 'junegunn/vim-easy-align'
" Comments
Plugin 'scrooloose/nerdcommenter'
" Snippets
if (has('python') || has('python3')) && v:version < 704
    " Ultisnips (snippets w/ python)
    Plugin 'SirVer/ultisnips'
else
    " Snipmate (snippets w/o python)
    Plugin 'MarcWeber/vim-addon-mw-utils'
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
endif
" Snippets
Plugin 'honza/vim-snippets'
" Case-preserving search/replace and more
Plugin 'tpope/vim-abolish'

call vundle#end()
filetype plugin indent on
runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snippet settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (has('python') || has('python3')) && v:version < 704
    " Ultisnips settings
else
    " Snipmate settings
    let g:snipMate = {}
    let g:snipMate.scope_aliases = {}
    "let g:snipMate.scope_aliases['verilog_systemverilog'] = 'verilog_systemverilog,systemverilog'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GVIM/VIM specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_running')
    " nothing for now
else
    let g:airline_left_sep=''
    let g:airline_right_sep=''
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editor look/feel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
set mouse=a
set ttymouse=xterm2

" Window
if v:version < 704
    set number
else
    set number
    set rnu
endif
syntax on
"set smartindent
set smartcase
set ai
set title
set showmode
set ruler
set cursorline

" Colorscheme
colorscheme molokai

" Special colors
"highlight   Pmenu         ctermfg=white ctermbg=237
"highlight   PmenuSel      ctermfg=black ctermbg=blue
"highlight   PmenuSbar     ctermfg=black ctermbg=blue
"highlight   PmenuThumb    ctermfg=white ctermbg=237
"hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE guibg=darkgrey guifg=NONE
hi clear SpellBad
hi SpellBad cterm=underline ctermfg=red

" Tabs
set ts=4
set shiftwidth=4

" Search
set hlsearch
set showmatch
set incsearch
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start
let mapleader = ","
let maplocalleader = ","

" Fix shift-backspace
imap <S-BS> <BS>

" Pasting
xnoremap p pgvy

" Quick up/down
nnoremap <up> 
nnoremap <down> 

" Tab switch
nnoremap <left> gT
nnoremap <right> gt

" No movement in insert
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Movement
nnoremap j gj
nnoremap k gk

" Windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>O O<Esc>j
nmap <leader>o o<Esc>k
nmap <leader>p :set paste!<CR>
nmap <leader>pp :set paste<CR>i<C-r>+<Esc>:set paste!<CR>
nmap <leader>b :bn<CR>
nmap <leader>bb :bp<CR>

" Spelling
nmap <leader>s :setlocal spell! spelllang=en_us<CR>

" Show/hide highlighting
nmap <leader>h :set hlsearch!<CR>
"nmap <silent> <leader>t :call ShowTabs()<CR>

" Quicklist
nmap <leader>e :cn<CR>
nmap <leader>ee :cp<CR>
nmap <leader>eo  :cope<CR>
nmap <leader>ec  :cope<CR>:q<CR>

" Show tabs?
nmap <leader>st :exe '%s/\v%(^ *)@<= {'.&ts.'}/\t/g'<CR>:set noet<CR>
nmap <leader>ts :exe '%s/^\t\+/\=repeat(" ", len(submatch(0)) *'. &ts .')'<CR>:set et<CR>

"nmap <leader>rw :%s/\<<C-r><C-w>\>/
"nmap <leader>rl :s/\<<C-r><C-w>\>/

" Jump to TODO?
nmap <leader>to :grep "TODO:"<CR>:cope<CR>

" Common changes
nnoremap c_ ct_
nnoremap cU c/\v[A-Z]<CR>
nnoremap cu c/\v[a-z]<CR>

" Jump to paste
nnoremap gp `[v`]

" Alignment
vmap a <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Tab complete
let g:SuperTabDefaultCompletionType = "context"

" Change numbering
nnoremap <silent> <leader>n :set rnu! rnu?<CR>

" Escape shortcuts
imap jj <Esc>
imap kk <Esc>
imap hh <Esc>
imap lll <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set spelllang=en_us

" Toggle spell checking on and off with `,s`
" remap esc
nmap <silent> <leader>s :set spell!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Statusline
"au InsertEnter * hi StatusLine ctermfg=161
"au InsertLeave * hi StatusLine ctermfg=236 ctermbg=253
"set statusline=%#SLfile#\ %<%f\ %h%m%r\ %#SLtype#\ %Y\ %*\ 0%=%-14.(%l,%c%V%)\ %P
"hi SLfile ctermbg=0 ctermfg=6 cterm=bold
"hi SLtype ctermbg=4 cterm=bold

" custom matches
au BufReadPost,FileReadPost *.cpp,*.cc,*.hpp syntax match Namespace /[a-zA-Z_0-9]*:/hs=s,he=e-1
au BufReadPost,FileReadPost *.cpp,*.cc,*.hpp syntax match NameType /:[a-zA-Z_0-9]*[ \);]/hs=s+1,he=e-1
au BufReadPost,FileReadPost *.sp nmap <silent> <leader>cc :s/^/*/ <CR>
au BufReadPost,FileReadPost *.sp nmap <silent> <leader>co :s/^\*// <CR>
au BufReadPost,FileReadPost *.sp vmap <silent> <leader>cc :s/^/*/ <CR>
au BufReadPost,FileReadPost *.sp vmap <silent> <leader>co :s/^\*// <CR>
au BufReadPost,FileReadPost *.dust : set syntax=html

"c-lang
"let g:clang_complete_auto=0
"let g:clang_hl_errors=1

au BufReadPost,FileReadPost *.c,*.h,*.cc,*.cpp,*.hpp let w:m1=matchadd('Longline', '\%>80v.\+', -1)
highlight Longline ctermbg=red

" commands
au FileType csh,tcsh,tcl,perl,python : noremap <buffer> <silent> <leader>cc :call PythonComment()<CR>
au FileType csh,tcsh,tcl,perl,python : noremap <buffer> <silent> <leader>co :call PythonUnComment()<CR>
au FileType css : noremap <buffer> <silent> <leader>cc :call CssComment()<CR>
au FileType css : noremap <buffer> <silent> <leader>co :call CssUnComment()<CR>

"YAML
au FileType yaml : setlocal et ts=2 sw=2
"
"au BufReadPost,FileReadPost *.tcl,*.pl,*.py,*.cgi : map <leader>cc :call PythonComment()<CR>
"au BufReadPost,FileReadPost *.tcl,*.pl,*.py,*.cgi : map <leader>co :call PythonUnComment()<CR>

" for the weird perl comment issue
au FileType tcsh,csh,tcl,perl,python : inoremap <buffer> # X#

" functions
function! CssComment ( ) range
    silent exe a:firstline.','.a:lastline.":s:^:/*"
    silent exe a:firstline.','.a:lastline.":s:$:*/"
endfunction

function! CssUnComment ( ) range
    silent exe a:firstline.','.a:lastline.":s:\\(/\\*\\|\\*/\\)::g"
endfunction

function! PythonComment ( ) range
    silent exe a:firstline.','.a:lastline.":s/^/#/"
endfunction

function! PythonUnComment ( ) range
    silent exe a:firstline.','.a:lastline.":s/#//"
endfunction

function! ShowTabs ( )
    if !exists("g:TabChars")
        let g:TabChars = &listchars
        set list
        set listchars=tab:\|\ 
    else
        set nolist
        let &listchars = g:TabChars
        unlet g:TabChars
    endif
endfunction

" Makefiles
au FileType make : set sw=4 ts=4 noexpandtab

au FileType verilog_systemverilog : set expandtab ts=2 sw=2
au FileType systemverilog : set expandtab ts=2 sw=2
