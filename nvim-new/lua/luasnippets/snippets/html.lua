---@diagnostic disable: undefined-global

return {
  s(
    { trig = 'boiler', snippetType = 'snippet' },
    fmt(
      [[
<!DOCTYPE html>
<html lang="{1}">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>{2}</title>
</head>
<body>
</body>
</html>
]],
      { i(1, 'en'), i(2, 'Document') }
    )
  ),
  s({ trig = 'a', snippetType = 'snippet' }, fmt([[<a href="{1}">{2}</a>]], { i(1, 'https://'), i(2, 'Link') })),
  s({ trig = 'script', snippetType = 'snippet' }, fmt([[<script src="{1}" defer></script>]], { i(1, 'app.js') })),
  s(
    { trig = 'css', snippetType = 'snippet' },
    fmt([[<link rel="stylesheet" href="{1}" />]], { i(1, '/css/style.css') })
  ),
  s({ trig = 'par', snippetType = 'snippet' }, fmt([[<p>{1}</p>]], { i(1) })),
  s(
    { trig = 'img', snippetType = 'snippet' },
    fmt([[<img src="{1}" alt="{2}" />]], { i(1, '/assets/image.png'), i(2, 'image') })
  ),
  s(
    { trig = 'ul', snippetType = 'snippet' },
    fmt(
      [[
		<ul>
			{1}
		</ul>]],
      { i(1, 'li') }
    )
  ),
  s(
    { trig = 'ol', snippetType = 'snippet' },
    fmt(
      [[
		<ol>
			{1}
		</ol>]],
      { i(1, 'li') }
    )
  ),
  s(
    { trig = 'dl', snippetType = 'snippet' },
    fmt(
      [[
		<dl>
			<dt>{1}</dt>
			<dd>{2}</dd>
		</dl>]],
      { i(1), i(2) }
    )
  ),
  s({ trig = 'li', snippetType = 'snippet' }, fmt([[<li>{1}</li>]], { i(1) })),
  s(
    { trig = 'dt', snippetType = 'snippet' },
    fmt(
      [[
		<dt>{1}</dt>
		<dd>{2}</dd>
		]],
      { i(1), i(2) }
    )
  ),
  s({ trig = 'code', snippetType = 'snippet' }, fmt([[<code>{1}</code>]],     { i(1) })),
  s({ trig = 'bf',   snippetType = 'snippet' }, fmt([[<strong>{1}</strong>]], { i(1) })),
  s({ trig = 'em',   snippetType = 'snippet' }, fmt([[<em>{1}</em>]],         { i(1) })),
  s(
    { trig = '<', snippetType = 'snippet' },
    fmt(
      [[
		<{}>
			{}
		</{}>
		]],
      { i(1, 'div'), i(2), rep(1) }
    )
  ),
  -- s({ trig = '<<', snippetType = 'autosnippet' }, fmt([[<{}>{}</{}>]], { i(1, 'div'), i(2), rep(1) })),
  s(
    { trig = '<<', snippetType = 'autosnippet' },
    fmt('<{}>{}</{}>', {
      i(1, 'div'),
      i(2),
      f(function(args)
        -- args[1][1] is the current text of insert node 1 (first line)
        local open = args[1][1] or ''
        -- take only the tag name (up to first whitespace)
        return (open:match('^%s*([^%s/>]+)') or open)
      end, { 1 }),
    })
  ),
  s({ trig = 'lt', snippetType = 'snippet' }, t([[&lt;]])),
  s({ trig = 'gt', snippetType = 'snippet' }, t([[&gt;]])),
  s(
    'form',
    fmt(
      [[
<form action="{}" method="{}">
  <label for="{}">{}</label>
  <input id="{}" type="{}" />

  <button type="submit">{}</button>
</form>
]],
      {
        i(1),
        i(2, 'post'),
        i(3, 'name'),
        i(4, 'Name'),
        rep(3),
        i(5, 'text'),
        i(6, 'Submit'),
      }
    )
  ),
  s(
    'table',
    fmt(
      [[
<table>
  <thead>
    <tr>
      <th scope="col">{}</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{}</td>
    </tr>
  </tbody>
</table>
]],
      {
        i(1, 'Header'),
        i(2, 'Cell'),
      }
    )
  ),
}
