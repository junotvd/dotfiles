-- check gewone nvim config voor insane goede snippest voor typst
---@diagnostic disable: undefined-global

-- function in_math_mode()
-- end


return {
	s({ trig = 'mk', snippetType = 'autosnippet' },
		fmta('$<>$', { i(1) })
	),
	s({ trig = '([^%s]+t', regTrig = true },
		fmta('(<>)^(<>)', {
			f(function(_, s) return s.captures[1] end),
			i(1)
		})
	),
}
