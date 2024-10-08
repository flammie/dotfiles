" Vundle START
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'dpelle/vim-LanguageTool'
Plugin 'w0rp/ale'
Plugin 'flammie/vim-apertium'
Plugin 'flammie/vim-finitestatemorphology'
Plugin 'flammie/vim-conllu'
Plugin 'flammie/vim-unicode-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/po.vim--gray'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'cespare/vim-toml'
Plugin 'chrisbra/unicode.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Vundle END
"
" my setup
set so=4
set ts=4
set shiftwidth=4
set expandtab
set list
set nu
set numberwidth=4
set modeline
set modelines=5
set cinoptions=>4,n-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1,t0
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
set termguicolors
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
filetype plugin indent on
syntax enable
syntax sync minlines=256
set synmaxcol=128
set redrawtime=10000
set cole=1
command W w
command Wq wq
command Q q
map u <Nop>
map U :undo<CR>

" always highlight overlong lines as error!
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" show listchars very visibly pls
highlight SpecialKey ctermfg=lightred

" po.vim setup (me, Finnish team)
let g:po_translator = "Flammie A Pirinen <flammie@iki.fi>"
let g:po_lang_team = "Lokalisointi-Laatu <laatu@lokalisointi.org>"

" language tool meh
let g:languagetool_jar = "~/LanguageTool-3.8/languagetool-commandline.jar"
" gvim don't be smart with file selector
:autocmd FileType * unlet! b:browsefilter

" syntastic tweaks
let g:syntastic_python_pylint_quiet_messages = {
    \ "regex": '\[invalid-name\]' }
" syntastic suggested defaults:
" <https://github.com/vim-syntastic/syntastic#3-recommended-settings>
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ALE tewaks
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
" let g:ale_lint_delay = 6400
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠'
let g:ale_conllu_validate_executable = $HOME . '/github/universaldependencies/tools/validate.py'
let g:ale_conllu_validate_options = '--lang krl'
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"let g:ale_lint_on_save = 0
let g:ale_fix_on_save = 1
let g:ale_linters = {
    \ 'cpp': ['cc', 'ccls', 'clazy', 'cppcheck',
    \         'cpplint', 'cquery', 'flawfinder']
\}
let g:ale_fixers = {
    \ 'python': ['isort'],
    \ 'cpp': ['clang-format']
\}
" indent guides
let g:indent_guides_enable_on_vim_startup = 1

" lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified',
      \               'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': 'U+%04B',
      \   'fugitive': '%{FugitiveHead()}'
      \ },
      \ }

" gitgutter against huge files
let g:gitgutter_max_signs = 5000
