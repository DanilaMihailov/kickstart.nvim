local ls = require 'luasnip'
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node

ls.cleanup() -- for testing

ls.add_snippets('javascript', {
  s({ trig = '$ctrl', name = 'angularjs controller' }, {
    t [[angular.module('kkrm').controller(']],
    d(1, function()
      local fname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
      local splitted = vim.split(fname, '.', { plain = true })
      return sn(nil, {
        i(1, splitted[1]),
      })
    end),
    t [[', function ($scope]],
    i(2, ''),
    t ') {',
    t { '', '  ' },
    i(0),
    t { '', '' },
    t '});',
  }),
  s({ trig = 'sfn', name = 'scope function' }, {
    t '$scope.',
    i(1, 'name'),
    t ' = function (',
    i(2, ''),
    t ') {',
    t { '', '  ' },
    i(0),
    t { '', '' },
    t '};',
  }),
  s({ trig = 'svar', name = 'scope variable' }, {
    t '$scope.',
    i(1, 'name'),
    t ' = ',
    i(2, 'val'),
    t ';',
    i(0),
  }),
})
