local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets('http', {
  s('get', {
    t '### ',
    i(1, 'Title or comment'),
    t { '', '' },
    t 'GET ',
    i(2, 'https://example.com'),
    t ' HTTP/1.1',
    t { '', 'Content-Type: application/json', 'Authorization: Bearer ' },
    i(3, 'your_token_here'),
    t { '', '' },
  }),

  s('post', {
    t '### ',
    i(1, 'POST Request Title'),
    t { '', '' },
    t 'POST ',
    i(2, 'https://example.com'),
    t ' HTTP/1.1',
    t { '', 'Content-Type: application/json', 'Authorization: Bearer ' },
    i(3, 'your_token_here'),
    t { '', '', '' },
    i(4, '{ "key": "value" }'),
  }),

  s('put', {
    t '### ',
    i(1, 'PUT Request Title'),
    t { '', '' },
    t 'PUT ',
    i(2, 'https://example.com'),
    t ' HTTP/1.1',
    t { '', 'Content-Type: application/json', 'Authorization: Bearer ' },
    i(3, 'your_token_here'),
    t { '', '', '' },
    i(4, '{ "key": "value" }'),
  }),

  s('delete', {
    t '### ',
    i(1, 'DELETE Request Title'),
    t { '', '' },
    t 'DELETE ',
    i(2, 'https://example.com'),
    t ' HTTP/1.1',
    t { '', 'Content-Type: application/json', 'Authorization: Bearer ' },
    i(3, 'your_token_here'),
    t { '', '' },
  }),

  s('custom', {
    t '### ',
    i(1, 'Custom HTTP Request'),
    t { '', '' },
    i(2, 'METHOD'),
    t ' ',
    i(3, 'https://example.com'),
    t ' HTTP/1.1',
    t { '', 'Content-Type: application/json', 'Authorization: Bearer ' },
    i(4, 'your_token_here'),
    t { '', '', '' },
    i(5, '{ "key": "value" }'),
  }),
})

return {}
