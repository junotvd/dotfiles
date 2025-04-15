if !has('conceal')
    finish
endif

" --------- Sectioning Commands ---------
" syntax region texChapterCmd start="\\chapter{" end="}" concealends
" syntax region texSectionCmd start="\\section{" end="}" concealends
" syntax region texSubsectionCmd start="\\subsection{" end="}" concealends
"
" highlight texChapterCmd cterm=bold gui=bold
" highlight texSectionCmd cterm=bold gui=bold
" highlight texSubsectionCmd cterm=bold gui=bold

" --------- Environment Conceals ---------
" Format: \begin{env} → EnvNameSymbol
" Note: we use bold cchars and highlight groups

" proof
syntax match texEnvProofBegin /\\begin{proof}/ conceal cchar=𝙿
syntax match texEnvProofEnd /\\end{proof}/ conceal cchar=𝙿
highlight texEnvProofBegin cterm=bold gui=bold
highlight texEnvProofEnd cterm=bold gui=bold

" bewijs (Dutch for proof)
syntax match texEnvBewijsBegin /\\begin{bewijs}/ conceal cchar=𝘉
syntax match texEnvBewijsEnd /\\end{bewijs}/ conceal cchar=𝘉
highlight texEnvBewijsBegin cterm=bold gui=bold
highlight texEnvBewijsEnd cterm=bold gui=bold

" stelling (Theorem)
syntax match texEnvStellingBegin /\\begin{stelling}/ conceal cchar=⊢
syntax match texEnvStellingEnd /\\end{stelling}/ conceal cchar=⊢
highlight texEnvStellingBegin cterm=bold gui=bold
highlight texEnvStellingEnd cterm=bold gui=bold

" lemma
syntax match texEnvLemmaBegin /\\begin{lemma}/ conceal cchar=ℒ
syntax match texEnvLemmaEnd /\\end{lemma}/ conceal cchar=ℒ
highlight texEnvLemmaBegin cterm=bold gui=bold
highlight texEnvLemmaEnd cterm=bold gui=bold

" definitie (definition)
syntax match texEnvDefinitieBegin /\\begin{definitie}/ conceal cchar=𝘿
syntax match texEnvDefinitieEnd /\\end{definitie}/ conceal cchar=𝘿
highlight texEnvDefinitieBegin cterm=bold gui=bold
highlight texEnvDefinitieEnd cterm=bold gui=bold

" voorbeeld (example)
syntax match texEnvVoorbeeldBegin /\\begin{voorbeeld}/ conceal cchar=V
syntax match texEnvVoorbeeldEnd /\\end{voorbeeld}/ conceal cchar=V
highlight texEnvVoorbeeldBegin cterm=bold gui=bold
highlight texEnvVoorbeeldEnd cterm=bold gui=bold

syntax match texEnvOpmerking /\\begin{opmerking}/ conceal cchar=O
syntax match texEnvOpmerkingEnd /\\end{opmerking}/ conceal cchar=O
highlight texEnvOpmerkingBegin cterm=bold gui=bold
highlight texEnvOpmerkingEnd cterm=bold gui=bold

syntax match texEnvEnumerate /\\begin{enumerate}/ conceal cchar=+
syntax match texEnvEnumerateEnd /\\end{enumerate}/ conceal cchar=+
highlight texEnvEnumerateBegin cterm=bold gui=bold
highlight texEnvEnumerateEnd cterm=bold gui=bold

syntax match texEnvItemize /\\begin{itemize}/ conceal cchar=-
syntax match texEnvItemizeEnd /\\end{itemize}/ conceal cchar=-
highlight texEnvItemizeBegin cterm=bold gui=bold
highlight texEnvItemizeEnd cterm=bold gui=bold

" Color all math groups as Function
" hi! link texMathZoneA Normal
" hi! link texMathZoneB Normal
" hi! link texMathZoneC Normal
" hi! link texMathZoneD Normal
" hi! link texMathZoneE Normal
"
" hi! link texMathOper Normal
" hi! link texMathSuperSub Normal
" hi! link texMathDelim Normal
" hi! link texMathMatcher Normal
" hi! link texMathSymbol Normal

hi! link Conceal Normal
hi! link Function Normal
hi! link Special Normal
hi! link Statement Normal
