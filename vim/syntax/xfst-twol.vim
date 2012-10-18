" Vim syntax file
" Language:	XFST TWOL transducer description
" Maintainer:	Flammie Pirinen <tommi.pirinen@helsinki.fi>
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
  let main_syntax = 'xfst-twol'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword	twolKeyWords	Alphabet Diacritics Sets Definitions Rules Where in matched

" Operator
syn match	twolOper	/[|&!?*#+^;_]/	display
syn match	twolOper	/=>\|<=\|<\=>\|=/	display
syn region	twolBraces	start=/[({]/	end=/[})]/	contains=twolChar,twolPair,twolEscapee,twolOper
syn match	twolPair	/[^: ]\+:[^: ]\+/	display
syn match	twolPair	/[^: ]\+: /	display
syn match	twolPair	/ :[^: ]\+/	display
syn match	twolChar	/[A-Za-z]\+/	contained
" Identifier
syn region	twolRulename	start=/"/ end=/"/	oneline

" SpecialChar
syn match twolEscapee	/%[+%^]/	display

" Comments
syn keyword	twolCommentNotes	TODO FIXME XXX	contained
syn match	twolCommentInfos	/@\w\+/	contained
syn match	twolComment	/!.*/	contains=twolCommentNotes,twolCommentInfos

" Clusters, regions...

" Highlights
highlight def link	twolKeyWords	Keyword
highlight def link	twolEscapee	Character
highlight def link	twolRulename	Identifier
highlight def link	twolOper	Operator
highlight def link	twolChar	Character
highlight def link	twolPair	Character
highlight def link	twolCommentInfos	SpecialComment
highlight def link	twolCommentNotes	Todo
highlight def link	twolComment	Comment

let b:current_syntax = "twol"

if main_syntax == 'twol'
  unlet main_syntax
endif

" vim: ts=8
