return {

  -- Environments

  s({ trig = 'eq', descr = 'equation environment' },
    fmta([[
  \begin{equation}\label{eq:<>}
  <>.
  \end{equation}]],
      { i(1), i(0) }
    )),

  s({ trig = 'beg', snippetType = 'autosnippet', descr = 'begin environment' },
    fmta([[
      \begin{<>}
          <>
      \end{<>}]],
      { i(1), i(0), rep(1) }
    )),

  s({ trig = 'bbeg', snippetType = 'autosnippet', descr = 'begin environment for tcolorbox' },
    fmta([[
      \begin{<>}{<>}
          <>
      \end{<>}]],
      { i(1), i(2), i(0), rep(1) }
    )),

  s({ trig = 'bbbeg', snippetType = 'autosnippet', descr = 'begin environment for tcbtheorem' },
    fmta([[
      \begin{<>}{<>}{<>}
          <>
      \end{<>}]],
      { i(1), i(2), i(3), i(0), rep(1) }
    )),

  s({ trig = 'mk', snippetType = 'autosnippet', descr = 'inline math' },
    fmta('$<>$<>',
      { i(1), i(2) }
    )),

  s({ trig = 'md', snippetType = 'autosnippet', descr = 'display math' },
    fmta([[
      <>.
    <>]],
      { i(1), i(0), }
    )),

  s({ trig = 'item', snippetType = 'autosnippet', descr = 'itemize' },
    fmta([[
      \begin{itemize}
          \item <>
      \end{itemize}]],
      { i(0) }
    )),

  s({ trig = 'enum', snippetType = 'autosnippet', descr = 'enumerate' },
    fmta([[
      \begin{enumerate}
          \item <>
      \end{enumerate}]],
      { i(0) }
    )),

  s({ trig = 'alnum', snippetType = 'autosnippet', descr = 'enumerate with (alpha) label' },
    fmta([[
      \begin{enumerate}[label = (\alph*)]
          \item <>
      \end{enumerate}]],
      { i(0) }
    )),

  s({ trig = 'arnum', snippetType = 'autosnippet', descr = 'enumerate with (arabic) label' },
    fmta([[
      \begin{enumerate}[label = (\arabic*)]
          \item <>
      \end{enumerate}]],
      { i(0) }
    )),

  s({ trig = 'tt', name = 'Text' },
    fmta([[\text{<>}<>]],
      { i(1), i(0) })),

  s({ trig = 'it', name = 'Italic text' },
    fmta([[\textit{<>}<>]],
      { i(1), i(0) })),

  s({ trig = 'bf', name = 'Bold text' },
    fmta([[\textbf{<>}<>]],
      { i(1), i(0) })),

  s({ trig = 'sl', name = 'Slanted text' },
    fmta([[\textsl{<>}<>]],
      { i(1), i(0) })),

  s({ trig = 'em', name = 'Emphasize' },
    fmta([[\emph{<>}<>]],
      { i(1), i(0) })),

  s({ trig = 'ttt', name = 'tt text' },
    fmta([[\texttt{<>}<>]],
      { i(1), i(0) })),




  -- Theorems (TColorbox)

  s({ trig = 'bew', descr = 'bewijs theorem' },
    fmta([[
      \begin{bewijs}{}{}
          <>
      \end{bewijs}]],
      { i(0) }
    )),

  s({ trig = 'def', descr = 'definitie theorem' },
    fmta([[
      \begin{definitie}{<>}{<>}
          <>
      \end{definitie}]],
      { i(1), i(2), i(0) }
    )),

  s({ trig = 'eig', descr = 'eigenschap theorem' },
    fmta([[
      \begin{eigenschap}{<>}{<>}
          <>
      \end{eigenschap}]],
      { i(1), i(2), i(0) }
    )),


  s({ trig = 'stel', descr = 'stelling theorem' },
    fmta([[
      \begin{stelling}{<>}{<>}
          <>
      \end{stelling}]],
      { i(1), i(2), i(0) }
    )),

  s({ trig = 'vb', descr = 'voorbeeld theorem' },
    fmta([[
      \begin{voorbeeld}{}{}
          <>
      \end{voorbeeld}]],
      { i(0) }
    )),
}
