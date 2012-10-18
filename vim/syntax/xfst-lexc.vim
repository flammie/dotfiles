" Vim syntax file
" Language:	XFST LexC transducer description
" Maintainer:	Flammie Pirinen <flammie@iki.fi>
" Last Change:	$LastChangedDate: 2006-12-16 22:06:40 -0400 (dom, 16 apr 2006) $
" URL: http://www.ling.helsinki.fi/~tapirine/#FIXME
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'xfst-lexc'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword	lexcKeyWords	Multichar_Symbols Definitions Declarations LEXICON END
syn keyword     lexcKeyWordErrors       multichar_symbols Multichar_symbols Lexicon lexicon

" Multichar data
syn region      lexcMultichars  start=/^Multichar_Symbols/ end=/^LEXICON/       keepend
syn match       lexcMulticharSymbol /\([^ :;\t]\|%[:; ]\)*/        contains=lexcFlagDiacritic,lexcEscape
" LEXICON data
syn region      lexcLexicons    start=/^LEXICON/ end=/^LEXICON/        keepend
syn match       lexcLexicon     /\([^ ;]*\)\s\+;/       display
syn match       lexcFirstString        /^\s*\([^<: \t%]\|%[:< ]\)*/ contains=lexcEscape,lexcFlagDiacritic
syn match       lexcSecondString        /:\([^<: \t%]\|%[:< ]\)*/ contains=lexcEscape,lexcFlagDiacritic
syn region      lexcRegex       start=/</       end=/>/ skip=/%>/       keepend
syn match       lexcEscape      /%./    contained
syn match       lexcFlagDiacritic       /@[UPRCDN]\.[a-zA-Z0-9]*\.\?[a-zA-Z0-9]*@/        contained
syn match       lexcGloss       /"[^"]*"/       contained
" Legacy end marker...
syn region      lexcEnded       start=/^END/ end=/\%$/ display

" Comments
syn keyword	lexcCommentNotes	TODO FIXME XXX	contained
syn match	lexcCommentInfos	/@\w\+/	contained
syn match	lexcComment	/!.*/	contains=lexcCommentNotes,lexcCommentInfos

" Clusters, regions...

" Highlights
highlight def link	lexcKeyWords	Keyword
highlight def link      lexcKeyWordErrors       Error
highlight def link	lexcFirstString String
highlight def link      lexcSecondString        Character
highlight def link	lexcLexicon	Identifier
highlight def link      lexcLexiconName Identifier
highlight def link	lexcRegex	String
highlight def link      lexcEscape      SpecialChar
highlight def link      lexcFlagDiacritic       Special
highlight def link      lexcGloss       Error
highlight def link	lexcCommentInfos	SpecialComment
highlight def link	lexcCommentNotes	Todo
highlight def link	lexcComment	Comment
highlight def link      lexcEnded       Comment

let b:current_syntax = "xfst-lexc"

if main_syntax == 'xfst-lexc'
  unlet main_syntax
endif

" vim: ts=8
