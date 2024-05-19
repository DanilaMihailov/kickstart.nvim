return {

  { 'folke/tokyonight.nvim' },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      local gruvbox = require 'gruvbox'
      gruvbox.setup {
        contrast = 'hard',
        -- dim_inactive = false,
        -- transparent_mode = true,
        inverse = true,
        overrides = {
          LspSignatureActiveParameter = { link = 'Visual' },
          SignColumn = { bg = 'NONE' },
          DiffText = { bg = gruvbox.palette.faded_blue, fg = 'None' },
          GruvboxRedSign = { bg = 'NONE' },
          GruvboxYellowSign = { bg = 'NONE' },
          GruvboxBlueSign = { bg = 'NONE' },
          GruvboxAquaSign = { bg = 'NONE' },
          GruvboxGreenSign = { bg = 'NONE' },
          -- hide end of buffer '~' symbol
          EndOfBuffer = { fg = gruvbox.palette.dark0_hard },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
      vim.opt.background = 'dark'
      vim.cmd [[
        hi FoldColumn guibg=NONE
      ]]
    end,
  },
}
