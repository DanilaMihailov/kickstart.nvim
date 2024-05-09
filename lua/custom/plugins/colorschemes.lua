return {

  { 'folke/tokyonight.nvim' },
  {
    'olimorris/onedarkpro.nvim',
    priority = 1000, -- Ensure it loads first
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.

      local gruvbox = require 'gruvbox'
      gruvbox.setup {
        -- contrast = '',
        -- dim_inactive = false,
        -- transparent_mode = true,
        overrides = {
          SignColumn = { bg = 'NONE' },
          GruvboxRedSign = { bg = 'NONE' },
          GruvboxYellowSign = { bg = 'NONE' },
          GruvboxBlueSign = { bg = 'NONE' },
          GruvboxAquaSign = { bg = 'NONE' },
          GruvboxGreenSign = { bg = 'NONE' },

          -- hide end of buffer '~' symbol
          EndOfBuffer = { fg = gruvbox.palette.dark0 },
        },
      }
      vim.cmd.colorscheme 'gruvbox'
      vim.opt.background = 'dark'

      -- fix cursorline highlight breaking on operators
      vim.cmd.hi 'Operator ctermbg=NONE guibg=NONE'
      vim.cmd.hi 'Quote ctermbg=NONE guibg=NONE'
    end,
  },
}
