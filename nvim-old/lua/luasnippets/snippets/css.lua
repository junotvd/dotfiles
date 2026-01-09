---@diagnostic disable: undefined-global

return {
	s("rl",
		fmta([[
<> {
  <>
}]], {
			i(1, ".class"),
			i(2),
		})
	),
	s("flex",
		fmta([[
display: flex;
flex-direction: <>;
justify-content: <>;
align-items: <>;
]], {
			i(1, "row"),
			i(2, "center"),
			i(3, "center"),
		})
	),
	s("grid",
		fmta([[
display: grid;
grid-template-columns: <>;
gap: <>;
]], {
			i(1, "repeat(3, 1fr)"),
			i(2, "1rem"),
		})
	),
	s("mq",
		fmt([[
@media (min-width: {}) {{
  {}
}}]], {
			i(1, "768px"),
			i(2),
		})
	),
}
