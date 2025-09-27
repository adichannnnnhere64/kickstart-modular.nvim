local ls = require 'luasnip'
local s = ls.snippet
local t, i = ls.text_node, ls.insert_node

ls.add_snippets('java', {
  s('main', {
    t 'class ',
    i(1, 'ClassName'),
    t { ' {', '' },
    t '    public static void main(String[] args) {',
    t { '', '' },
    t '        System.out.println("',
    i(2, 'Hello'),
    t '");',
    t { '', '' },
    t '    }',
    t { '', '' },
    t '}',
  }),
})

return {}
