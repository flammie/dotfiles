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

" Lexicon data
syn match       lexcLexicon     /\([^ ;]*\)\s\+;/       display
syn match       lexcWord        /^\s*\([^#: %]\(%.\)\?\)\+\(:\([^#:% ]\(%.\)\?\)*\)\?/ display
syn region      lexcRegex       start=/</       end=/>/ skip=/%>/       keepend

" Comments
syn keyword	lexcCommentNotes	TODO FIXME XXX	contained
syn match	lexcCommentInfos	/@\w\+/	contained
syn match	lexcComment	/!.*/	contains=twolCommentNotes,twolCommentInfos

" Clusters, regions...

" Highlights
highlight def link	lexcKeyWords	Keyword
highlight def link	lexcWord	Character
highlight def link	lexcLexicon	Identifier
highlight def link	lexcRegex	String
highlight def link	lexcCommentInfos	SpecialComment
highlight def link	lexcCommentNotes	Todo
highlight def link	lexcComment	Comment

let b:current_syntax = "xfst-lexc"

if main_syntax == 'xfst-lexc'
  unlet main_syntax
endif

" vim: ts=8
