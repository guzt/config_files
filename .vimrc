set bg=dark
filetype on  " Automatically detect file types.
filetype plugin indent on
set nocompatible  " no vi compatibility.
set hlsearch
set ignorecase
set wrap
set scrolloff=15
let g:netrw_sort_sequence='[\/]$,.*\.[ch][xp]*$,*'
if has('gui_running')
	let g:Powerline_symbols = 'fancy'
	set guifont=Ubuntu\ Mono\ 13
	"set guifont=Monaco\ for\ Powerline\ 9
	"set guifont=NovaMono\ 11
	set guioptions+=a
	set guioptions-=T "toolbar
	set guioptions-=m "menubar
	set guioptions-=e "guitabs
	set cursorline
	"colorscheme gummybears
	"hi Normal guibg=#2C2C2C guifg=#DCDCCC
	"set cursorcolumn
	set background=light
	colorscheme fruit
	"highlight CursorLineNr guibg=#eee8d5
	"highlight SpecialKey guibg=NONE guifg=#cccccc
	"set fullscreen
else
	let g:Powerline_symbols = 'fancy'
	set t_Co=256
	set cursorline
	hi CursorLine cterm=BOLD ctermbg=8
endif

set colorcolumn=80
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
set hidden
set wildmenu
set showcmd

set foldmethod=syntax
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=syntax
"  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
"augroup END

" http://vim.wikia.com/wiki/Indent_with_tabs,_align_with_spaces
"set noexpandtab
"set copyindent
"set preserveindent
"set softtabstop=0
"set shiftwidth=4
"set tabstop=4
set cinoptions=(0,u0,U0

" Add recently accessed projects menu (project plugin)
set viminfo^=\!

" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" alt+n or alt+p to navigate between entries in QuickFix
map <silent> <m-p> :cp <cr>
map <silent> <m-n> :cn <cr>

" Change which file opens after executing :Rails command
let g:rails_default_file='config/database.yml'

syntax enable

set cf  " Enable error files & error jumping.
set clipboard+=unnamed  " Yanks go on clipboard instead.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands
set ruler  " Ruler on
set nu  " Line numbers on
" set nowrap  " Line wrapping off
set timeoutlen=250  " Time to wait after ESC (default causes an annoying delay)
" colorscheme vividchalk  " Uncomment this to set a default theme

" Formatting
set ts=4  " Tabs are 2 spaces
" set bs=4  " Backspace over everything in insert mode
set shiftwidth=4  " Tabs under smart indent
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
"set cindent
set autoindent
set smartindent
set smarttab
"set expandtab

" Visual
set showmatch  " Show matching brackets.
set mat=5  " Bracket blinking.
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:¦\ ,trail:░,eol:¬,extends:»,precedes:«
"set lcs=tab:∣—,trail:×·,eol:¶,extends:￫,precedes:￩
set novisualbell  " No blinking .
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.

" gvim specific
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modesc

" ctags/cscope config by sanjay
nmap ,t :!(cd %:p:h;ctags *.[ch])&
" set tags=./tags,../tags
" let &tags=getcwd() . '/tags'
" set tags=./tags;/
map <M-]> :tab split<CR>:tag <C-R>=expand("<cword>")<CR><CR>
if has("cscope") && filereadable("/usr/bin/cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable(getcwd() . "/cscope.out")
          cs add .
 "else add database pointed to by environment
  elseif $CSCOPE_DB != ""
 	      cs add $CSCOPE_DB/cscope.out $CSCOPE_DB
  endif
  set csverb

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

  nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>



    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

  nmap <C-@>s :tab scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>g :tab scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>c :tab scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>t :tab scs find t <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>e :tab scs find e <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@>f :tab scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@>i :tab scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-@>d :tab scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left
  nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
  nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif




""""""""""""" key map timeouts
" By default Vim will only wait 1 second for each keystroke in a mapping.
" You may find that too short with the above typemaps.  If so, you should
" either turn off mapping timeouts via 'notimeout'.
set notimeout

" Or, you can keep timeouts, by uncommenting the timeoutlen line below,
" with your own personal favorite value (in milliseconds):
"set timeoutlen=4000

" Either way, since mapping timeout settings by default also set the
" timeouts for multicharacter 'keys codes' (like <F1>), you should also
" set ttimeout and ttimeoutlen: otherwise, you will experience strange
" delays as vim waits for a keystroke after you hit ESC (it will be
" waiting to see if the ESC is actually part of a key code like <F1>).
set ttimeout 

" personally, I find a tenth of a second to work well for key code
" timeouts. If you experience problems and have a slow terminal or network
" connection, set it higher.  If you don't set ttimeoutlen, the value for
" timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
set ttimeoutlen=100


" Split navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
nnoremap <tab> <c-w><c-w>
set splitbelow
set splitright

" Split movement
" BROKEN: vim sees <C-S-xxx> and <C-xxx> the same
"nmap <silent> <c-s-k> :wincmd K<CR>
"nmap <silent> <c-s-j> :wincmd J<CR>
"nmap <silent> <c-s-h> :wincmd H<CR>
"nmap <silent> <c-s-l> :wincmd L<CR>



"set laststatus=2
""set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"set statusline=
"set statusline+=%<\                       " cut at start
"set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
"set statusline+=%-40f\                    " path
"set statusline+=%=%1*%y%*%*\              " file type
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P/%L                     " percentage of file

function! CCustomFuncHighlight()
	syn match    cCustomParen    "?=(" contains=cParen,cCppParen
	syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
	syn match    cCustomScope    "::"
	syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
	hi def link cCustomFunc  Function
	hi def link cCustomClass Function
endfunction

autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.cxx call CCustomFuncHighlight()


" Bundles
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
"Bundle 'FredKSchott/CoVim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'Lokaltog/vim-powerline'
Bundle 'jnurmine/Zenburn'
"Bundle 'mbbill/code_complete'
"Bundle 'bling/vim-airline'

"let g:completekey='<A-p>'

command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse write
                           \|    else
                           \|        write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :Update<CR>
inoremap <silent> <C-S> <C-O>:Update<CR>
map <silent> <m-left> :ptprev<cr>
map <silent> <m-right> :ptnext<cr>

inoremap <silent> <M-h> <left>
inoremap <silent> <M-j> <down>
inoremap <silent> <M-k> <up>
inoremap <silent> <M-l> <right>
inoremap <silent> <M-v> <C-o>v
inoremap <silent> <M-u> <C-o>u
inoremap <silent> <M-r> <C-o><C-r>
inoremap <silent> <S-C-v> <C-o><C-v>


set ttimeout 

set ssop-=options
"set ssop-=folds
