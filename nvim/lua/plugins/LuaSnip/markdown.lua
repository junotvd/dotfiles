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
    })
}
