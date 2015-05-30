" Vim syntax file
" Language:     VISL CG-3 natural language constraint grammar 
" Maintainer:   Flammie Pirinen <flammie@iki.fi>
" Last Change:  2015-05-30T20:02:22+0100
" URL: http://iki.fi/~flammie
"
" Stolen from php.vim
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'vislcg3'
endif

syn sync clear

syn case match

" Internal keywords
syn keyword     vislcg3KeyWords         ADD ADDCOHORT ADDRELATION ADDRELATIONS AFTER-SECTIONS ALL AND APPEND BARRIER BEFORE-SECTIONS CBARRIER CONSTRAINTS COPY CORRECTIONS DELIMIT DELIMITERS END EXTERNAL IF IFF INCLUDE LINK LIST MAP MAPPINGS MAPPING-PREFIX MOVE NEGATE NONE NOT NULL-SECTION OPTIONS PREFERRED-TARGETS REMCOHORT REMOVE REMRELATION REMRELATIONS REPLACE SECTION SELECT SET SETCHILD SETPARENT SETRELATION SETRELATIONS SETS SOFT-DELIMITERS STATIC-SETS STRICT-TAGS SUBSTITUTE SWITCH TARGET TEMPLATE TO UNMAP OR
syn match     vislcg3Operators        /[-|+^∩∆]/

" some fragments
syn match       vislcg3Id               /[[:alnum:]_-]*/
syn match       vislcg3Form             /"<[^>]*>"/     contained
syn match       vislcg3Word             /"[^"]"/        contained
syn region      vislcg3Bracketed        start=/(/       end=/)/       contains=vislcg3Form,vislcg3Word,vislcg3Id,vislcg3Operators

" Comments
syn keyword     vislcg3CommentNotes     TODO FIXME XXX  contained
syn match       vislcg3CommentInfos     /@\w\+/ contained
syn match       vislcg3Comment  /#.*/   contains=vislcg3CommentNotes,vislcg3CommentInfos

" Clusters, regions...

" Highlights
highlight def link      vislcg3KeyWords Keyword
highlight def link      vislcg3Form String
highlight def link      vislcg3Word        Character
highlight def link      vislcg3Id  Identifier
highlight def link      vislcg3LexiconName Identifier
highlight def link      vislcg3Regex    String
highlight def link      vislcg3Operator      SpecialChar
highlight def link      vislcg3CommentInfos     SpecialComment
highlight def link      vislcg3CommentNotes     Todo
highlight def link      vislcg3Comment  Comment

let b:current_syntax = "vislcg3"

if main_syntax == 'vislcg3'
  unlet main_syntax
endif

" vim: ts=8
