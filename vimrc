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
set hls
set laststatus=2
set statusline=%<%f:%l.%c%V\ 0x%B\ %h%m%r%y%=%P
if has("multi_byte")
    set lcs=tab:␉-,eol:␤,trail:·,nbsp:␣,extends:»,precedes:«
else
    set lcs=tab:>-,eol:$,trail:-,nbsp:%,extends:>,precedes:<
endif
colorscheme inkpot
filetype plugin indent on
