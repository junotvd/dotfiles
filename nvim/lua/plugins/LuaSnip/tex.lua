local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local get_visual = function(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else  -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
return {

    require("luasnip").config.set_config({
        enable_autosnippets = true,
    }),

    ls.add_snippets("tex", {
        s("mk", {
            t("$"), i(1), t("$"), i(0)
        }),

        s("md", {
            t({"\\[", "\t"}),
            i(1),
            t({"\t", "\\]", "\t"}),
            i(0)
        }),

        s({ trig = ";a", autosnippet = true},
            {
                t("\\alpha"),
            }
        ),

        s({ trig = ";b"},
            {
                t("\\beta"),
            }
        ),

        s({ trig = ";c"},
            {
                t("\\gamma"),
            }
        ),

        s({ trig = ";C"},
            {
                t("\\Gamma"),
            }
        ),

        s({ trig = ";e"},
            {
                t("\\epsilon"),
            }
        ),

        s({ trig = ";l"},
            {
                t("\\lambda"),
            }
        ),

        s({ trig = ";s"},
            {
                t("\\sigma"),
            }
        ),

        s({ trig = ";S"},
            {
                t("\\Sigma"),
            }
        ),

        s({ trig = ";vs"},
            {
                t("\\varsigma"),
            }
        ),

        s({ trig = ";p"},
            {
                t("\\phi"),
            }
        ),
        s({ trig = ";P"},
            {
                t("\\Phi"),
            }
        ),
        s({ trig = ";vp"},
            {
                t("\\varphi"),
            }
        ),


        s({ trig = "->"},
            {
                t("\\rightarrow"),
            }
        ),

        s({ trig = "-->"},
            {
                t("\\longrightarrow"),
            }
        ),

        s({ trig = "=>"},
            {
                t("\\Rightarrow"),
            }
        ),

        s({ trig = "==>"},
            {
                t("\\Longrightarrow"),
            }
        ),

        s({ trig = "min"},
            {
                t("\\setminus"),
            }
        ),

        s({ trig = "NN"},
            {
                t("\\mathbb{N}"),
            }
        ),

        s({ trig = "RR"},
            {
                t("\\mathbb{R}"),
            }
        ),

        s({ trig = "QQ"},
            {
                t("\\mathbb{Q}"),
            }
        ),

        s({ trig = "leq"},
            {
                t("\\leq"),
            }
        ),

        s({ trig = "geq"},
            {
                t("\\geq"),
            }
        ),

        s({ trig = "neq"},
            {
                t("\\neq"),
            }
        ),

        s({ trig = "*"},
            {
                t("\\cdot"),
            }
        ),

        s({trig = "bf"},
        fmta(
                "\\textbf{<>}",
                { i(1) }
            )
        ),

        s({trig = "tt"},
        fmta(
                "\\texttt{<>}",
                { i(1) }
            )
        ),

        s({trig = "it"},
        fmta(
                "\\textit{<>}",
                { i(1) }
            )
        ),

        s({trig ="ff"},
            fmta(
                [[\frac{<>}{<>}]],
                {
                    i(1),
                    i(2)
                }
            )
        ),

        s({trig ="beg"},
            fmta(
                [[
                  \begin{<>}
                      <>
                  \end{<>}
                ]],
                {
                    i(1),
                    i(2),
                    rep(1)
                }
            )
        ),
    }),
    s(
        { trig = "([%a])sr", snippetType = "autosnippet", wordTrig = false, regTrig = true },
        fmta(
            "<>^2",
            { f(function(_, snip) return snip.captures[1] end) }
        )
    ),
}
