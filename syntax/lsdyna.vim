"-------------------------------------BOF---------------------------------------
"
" Vim syntax file
"
" Language:     Ls-Dyna FE solver input file
" Maintainer:   Bartosz Gradzik (bartosz.gradzik@hotmail.com)
" Version:      1.2.1
" Last Change:  24.05.2016
"
" History of change:
" v1.2.1
"   - *ELEMENT_SEATBELT supported
" v1.2.0
"   - new highlight groups used
" v1.1.0
"   - syntax highlight depends on keyword type now
" v1.0.0
"   - initial version
"
"-------------------------------------------------------------------------------

" check if syntax is already loaded
if exists("b:current_syntax") | finish | endif
" set flag when ls-dyna syntax is loaded
let b:current_syntax = "lsdyna"

"-------------------------------------------------------------------------------
"    Items shared among keywords
"-------------------------------------------------------------------------------

syntax match lsdynaComment '^\$.*$'
syntax match lsdynaTitle '^\(\h\|?\).*$' contained
syntax match lsdynaKeywordName '^\*\a.*$' contains=lsdynaKeywordOption
syntax match lsdynaKeywordOption '_.*$' contained
syntax match lsdynaNumber '-\?\d\+\.\?\([eE][+-]\?\d\+\)\?'
syntax match lsdynaParameter '&\S\+'
" syntax match lsdynaParameter '^[rRcCiI].*\S\+'
syntax match lsdynaParameterDef '\(^\)\@!\(\s\)\{-\}\a\S\+' contained

highlight default link lsdynaComment Comment
highlight default link lsdynaKeywordName Keyword
highlight default link lsdynaKeywordOption PreProc
highlight default link lsdynaTitle Identifier
highlight default link lsdynaNumber Number
highlight default link lsdynaParameter Special
highlight default link lsdynaParameterDef Special

"-------------------------------------------------------------------------------
"    Standard Ls-Dyna keyword
"-------------------------------------------------------------------------------

" syntax match lsdynaKeyword_02_Col '\%11c.\{10}' contained
" syntax match lsdynaKeyword_04_Col '\%31c.\{10}' contained
" syntax match lsdynaKeyword_06_Col '\%51c.\{10}' contained
" syntax match lsdynaKeyword_08_Col '\%71c.\{10}' contained

" highlight default link lsdynaKeyword_02_Col lsdynaColumn
" highlight default link lsdynaKeyword_04_Col lsdynaColumn
" highlight default link lsdynaKeyword_06_Col lsdynaColumn
" highlight default link lsdynaKeyword_08_Col lsdynaColumn

syntax cluster lsdynaKeywordCluster add=lsdynaComment
syntax cluster lsdynaKeywordCluster add=lsdynaKeywordName
syntax cluster lsdynaKeywordCluster add=lsdynaTitle
syntax cluster lsdynaKeywordCluster add=lsdynaNumber
syntax cluster lsdynaKeywordCluster add=lsdynaParameter
" syntax cluster lsdynaKeywordCluster add=lsdynaKeyword_02_Col
" syntax cluster lsdynaKeywordCluster add=lsdynaKeyword_04_Col
" syntax cluster lsdynaKeywordCluster add=lsdynaKeyword_06_Col
" syntax cluster lsdynaKeywordCluster add=lsdynaKeyword_08_Col

syntax region lsdynaKeywordReg start=/^\*\(PARAMETER\)\@!\a\+/ end=/^\*/me=s-1
  \ contains=@lsdynaKeywordCluster

"-------------------------------------------------------------------------------
"    Parameters
"-------------------------------------------------------------------------------

syntax match lsdynaPRMR '^[iIrRcC]' contains=lsdynaParameterDef

highlight default link lsdynaPRMR Identifier

syntax cluster lsdynaParameterCluster add=lsdynaParameter
syntax cluster lsdynaParameterCluster add=lsdynaNumber
syntax cluster lsdynaParameterCluster add=lsdynaPRMR
syntax cluster lsdynaParameterCluster add=lsdynaKeywordName
syntax cluster lsdynaParameterCluster add=lsdynaComment
syntax cluster lsdynaParameterCluster add=lsdynaParameterDef

syntax region lsdynaParameterReg start=/^\*PARAMETER/ end=/^\*/me=s-1
	\ contains=@lsdynaParameterCluster

"-------------------------------------------------------------------------------
"    Nodes
"-------------------------------------------------------------------------------

syntax match lsdynaNode_02_Col '\%9c.\{16}'  contained
syntax match lsdynaNode_04_Col '\%41c.\{16}' contained
syntax match lsdynaNode_06_Col '\%65c.\{8}'  contained

highlight default link lsdynaNode_02_Col lsdynaColumn
highlight default link lsdynaNode_04_Col lsdynaColumn
highlight default link lsdynaNode_06_Col lsdynaColumn

syntax cluster lsdynaNodeCluster add=lsdynaComment
syntax cluster lsdynaNodeCluster add=lsdynaKeywordName
syntax cluster lsdynaNodeCluster add=lsdynaNode_02_Col
syntax cluster lsdynaNodeCluster add=lsdynaNode_04_Col
syntax cluster lsdynaNodeCluster add=lsdynaNode_06_Col

syntax region lsdynaNodeReg start=/\c^\*NODE *$/ end=/^\*/me=s-1
 \ contains=@lsdynaNodeCluster
syntax region lsdynaAirbagRefReg start=/\c^\*AIRBAG_REF.*$/ end=/^\*/me=s-1
 \ contains=@lsdynaNodeCluster

"-------------------------------------------------------------------------------
"    Elements
"-------------------------------------------------------------------------------

syntax match lsdynaElem_02_Col '\%9c.\{8}'  contained
syntax match lsdynaElem_04_Col '\%25c.\{8}' contained
syntax match lsdynaElem_06_Col '\%41c.\{8}' contained
syntax match lsdynaElem_08_Col '\%57c.\{8}' contained
syntax match lsdynaElem_10_Col '\%73c.\{8}' contained

highlight default link lsdynaElem_02_Col lsdynaColumn
highlight default link lsdynaElem_04_Col lsdynaColumn
highlight default link lsdynaElem_06_Col lsdynaColumn
highlight default link lsdynaElem_08_Col lsdynaColumn
highlight default link lsdynaElem_10_Col lsdynaColumn

syntax cluster lsdynaElemCluster add=lsdynaComment
syntax cluster lsdynaElemCluster add=lsdynaKeywordName
syntax cluster lsdynaElemCluster add=lsdynaElem_02_Col
syntax cluster lsdynaElemCluster add=lsdynaElem_04_Col
syntax cluster lsdynaElemCluster add=lsdynaElem_06_Col
syntax cluster lsdynaElemCluster add=lsdynaElem_08_Col
syntax cluster lsdynaElemCluster add=lsdynaElem_10_Col

syntax region lsdynaElemReg start=/\c^\*ELEMENT_.*$/ end=/^\*/me=s-1
 \ contains=@lsdynaElemCluster
syntax region lsdynaAirbagShellReg start=/\c^\*AIRBAG_SHELL_.\+ *$/ end=/^\*/me=s-1
 \ contains=@lsdynaElemCluster
syntax region lsdynaElemBeltSlipReg start=/\c^\*ELEMENT_SEATBELT_\a\+\s*$/ end=/^\*/me=s-1
 \ contains=@lsdynaKeywordCluster

"-------------------------------------EOF---------------------------------------
