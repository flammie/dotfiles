if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Source\ Code\ Pro\ 10
elseif has("gui_macvim")
    set guifont=Source\ Code\ Pro:h13
else
    set guifont=Source_Code_Pro:h11:cDEFAULT
endif
let spell_language_list = "english,finnish"
let spell_finnish_iskeyword = "@,48-57,_,192-255,-"
let spell_auto_type = "tex,mail,text,html,sgml,otl,cvs,xml"
let spell_guess_language_ft = "all"
let spell_markup_ft = ",html,php,xhtml,xml,tex,mail,help,text,,"
highlight SpellErrors ctermfg=Red guifg=Red cterm=underline gui=underline term=reverse
