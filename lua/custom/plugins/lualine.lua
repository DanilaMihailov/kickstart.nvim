return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/noice.nvim' },
  config = function()
    local custom_gruvbox = require 'lualine.themes.gruvbox'
    custom_gruvbox.insert = custom_gruvbox.normal
    custom_gruvbox.visual = custom_gruvbox.normal
    custom_gruvbox.replace = custom_gruvbox.normal
    custom_gruvbox.command = custom_gruvbox.normal

    require('lualine').setup {
      options = {
        globalstatus = true,
        theme = custom_gruvbox,
        -- theme = 'tokyonight',
        icons_enabled = false,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'branch' },
        lualine_b = { 'diagnostics' },
        lualine_c = {
          { 'filename', path = 1 },
        },
        lualine_x = {
          {
            require('noice').api.status.message.get_hl,
            cond = require('noice').api.status.message.has,
          },
          {
            require('noice').api.status.command.get,
            cond = require('noice').api.status.command.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.mode.get,
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
          {
            require('noice').api.status.search.get,
            cond = require('noice').api.status.search.has,
            color = { fg = '#ff9e64' },
          },
          'encoding',
          'fileformat',
          'filetype',
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      tabline = {
        lualine_a = { { 'tabs', mode = 2, max_length = vim.o.columns } },
      },
      extensions = { 'quickfix', 'fugitive', 'nvim-tree' },
      -- winbar = {
      --   lualine_a = { 'filename', 'diagnostics' },
      -- },
      -- inactive_winbar = {
      --   lualine_a = { 'filename', 'diagnostics' },
      -- },
    }
  end,
}
