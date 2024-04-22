return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      globalstatus = true,
      -- theme = custom_gruvbox,
      icons_enabled = true,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { 'branch' },
      lualine_b = { 'diagnostics' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'lsp_progress', 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' },
    },
    tabline = {
      lualine_a = { { 'tabs', mode = 2, max_length = vim.o.columns } },
    },
    extensions = { 'quickfix', 'fugitive', 'nvim-tree' },
    -- winbar = {
    --     lualine_a  = {'filename', 'diagnostics'}
    -- },
    -- inactive_winbar = {
    --     lualine_a  = {'filename', 'diagnostics'}
    -- }
  },
}
