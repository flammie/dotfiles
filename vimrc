" Vundle START
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle END
"
" my setup
set so=1
set ts=4
set shiftwidth=4
set expandtab
set list
set nu
set numberwidth=4
set modeline
set modelines=5
set cinoptions=>4,n-2,{2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1,f2,t0
set cursorline
set colorcolumn=72,80,100
set showmatch
set hls
set laststatus=2
set statusline=%<%f:%l.%c%V\ 0x%B\ %h%m%r%y%=%P
if has("multi_byte")
    set lcs=tab:␉-,eol:␤,trail:·,nbsp:␣,extends:»,precedes:«
else
    set lcs=tab:>-,eol:$,trail:-,nbsp:%,extends:>,precedes:<
endif
set background=dark
colorscheme solarized
filetype plugin indent on
syntax sync minlines=256
set synmaxcol=128
command W w
command Wq wq
map u <Nop>

" always highlight overlong lines as error!
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" po.vim setup (me, Finnish team)
let g:po_translator = "Flammie A Pirinen <flammie@iki.fi>"
let g:po_lang_team = "Lokalisointi-Laatu <laatu@lokalisointi.org>"

" gvim don't be smart with file selector
:autocmd FileType * unlet! b:browsefilter

