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

    ls.add_snippets("tex", {})
    -- require("luasnip.loaders.from_snipmate").load({ path = {"./tex.snippets"} }),
}
