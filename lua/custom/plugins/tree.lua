return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  keys = '\\',
  config = function()
    local nvim_tree = require 'nvim-tree'
    local nvim_tree_api = require 'nvim-tree.api'
    nvim_tree.setup {
      diagnostics = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      view = {
        adaptive_size = true,
        float = {
          enable = false,
          open_win_config = {
            width = 50,
            height = 50,
          },
        },
      },
      renderer = {
        symlink_destination = false,
        indent_markers = {
          enable = true,
          icons = { corner = '└', edge = '│', item = '│', bottom = '─', none = ' ' },
          inline_arrows = true,
        },
      },
    }

    vim.keymap.set('n', '\\', function()
      nvim_tree_api.tree.toggle(true)
    end, { desc = 'Toggle File Tree' })
  end,
}
