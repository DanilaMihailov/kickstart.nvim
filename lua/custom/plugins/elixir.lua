return {
  'elixir-tools/elixir-tools.nvim',
  version = '*',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local elixir = require 'elixir'
    local elixirls = require 'elixir.elixirls'

    elixir.setup {
      nextls = {
        enable = false,
        init_options = {
          mix_env = 'dev',
          mix_target = 'host',
          experimental = {
            completions = {
              enable = true, -- control if completions are enabled. defaults to false
            },
          },
        },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', 'crfp', ':ElixirFromPipe<cr>', { desc = 'Elixir From Pipe', buffer = true, noremap = true })
          vim.keymap.set('n', 'crtp', ':ElixirToPipe<cr>', { desc = 'Elixir To Pipe', buffer = true, noremap = true })
          -- vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
        end,
      },
      credo = { enable = true },
      elixirls = {
        enable = true,
        settings = elixirls.settings {
          dialyzerEnabled = true,
          enableTestLenses = false,
          suggestSpecs = false,
        },
        on_attach = function(client, bufnr)
          vim.keymap.set('n', 'crfp', ':ElixirFromPipe<cr>', { desc = 'Elixir From Pipe', buffer = true, noremap = true })
          vim.keymap.set('n', 'crtp', ':ElixirToPipe<cr>', { desc = 'Elixir To Pipe', buffer = true, noremap = true })
          -- vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
        end,
      },
    }
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
