local ls = require 'luasnip'
local t = ls.text_node
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local fmta = require('luasnip.extras.fmt').fmta

ls.cleanup() -- for testing

ls.add_snippets('javascript', {
  s(
    { trig = '$ctrl', name = 'angularjs controller' },
    fmta(
      [[
    angular.module('kkrm').controller('<name>', function($scope<args>){
      <in_fn>
    });
    ]],
      {
        name = d(1, function()
          local fname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
          local splitted = vim.split(fname, '.', { plain = true })
          return sn(nil, {
            i(1, splitted[1]),
          })
        end),
        args = i(2),
        in_fn = i(0),
      }
    )
  ),
  s(
    { trig = '$ctrl2', name = 'separate ctrl' },
    fmta(
      [[
    angular.module('kkrm').controller('<name>', <name>);
    function <name> ($scope<args>) {
      <in_fn>
    };
    ]],
      {
        name = d(1, function()
          local fname = vim.fs.basename(vim.api.nvim_buf_get_name(0))
          local splitted = vim.split(fname, '.', { plain = true })
          return sn(nil, {
            i(1, splitted[1]),
          })
        end),
        args = i(2),
        in_fn = i(0),
      },
      { repeat_duplicates = true }
    )
  ),
  s(
    { trig = 'sfn', name = 'scope function' },
    fmta(
      [[
    $scope.<name> = function (<args>) {
      <last>
    };
    ]],
      { name = i(1, 'name'), args = i(2), last = i(0) }
    )
  ),
  s(
    { trig = 'svar', name = 'scope variable' },
    fmta('$scope.<name> = <val>;', { name = i(1, 'name'), val = i(2, 'val') })
  ),
})
