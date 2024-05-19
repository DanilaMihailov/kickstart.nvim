-- all git integrations live here (signs, status, diffview)
return {
  -- keeping for git blame
  'tpope/vim-fugitive',

  { -- better diff/merge tool
    'sindrets/diffview.nvim',
    ---@type DiffViewOptions
    opts = {
      enhanced_diff_hl = true,
    },
    init = function()
      vim.opt.fillchars:append { diff = '╱' }
    end,
  },
  { -- git status, branch, commit, merge, etc
    -- 'NeogitOrg/neogit',
    dir = '~/personal/nvim-plugins/neogit/',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim', -- optional
    },
    ---@type NeogitConfig
    opts = {
      disable_hint = true,
      highlight = {
        bold = false,
        italic = false,
      },
      git_services = {
        ['gitlab.clabs.net'] = 'https://gitlab.clabs.net/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}&merge_request[target_branch]=master',
      },
      disable_context_highlighting = true,
      graph_style = 'unicode',
      kind = 'split',
      -- disable_line_numbers = false,
      -- disable_relative_line_numbers = false,
      signs = {
        hunk = { '', '' },
        item = { '', '' },
        section = { '', '' },
      },
      sections = {
        untracked = {
          folded = true,
        },
      },
      status = {
        HEAD_padding = 0,
        show_head_commit_hash = false,
        mode_padding = 0,
        mode_text = {
          M = 'M',
          N = 'N',
          A = 'A',
          D = 'D',
          C = 'C',
          U = 'U',
          R = 'R',
          DD = 'DD',
          AU = 'AU',
          UD = 'UD',
          UA = 'UA',
          DU = 'DU',
          AA = 'AA',
          UU = 'UU',
          ['?'] = '?',
        },
      },
    },
    config = true,
    init = function()
      local neogit = require 'neogit'
      -- override fugitive command (use :Git for fugitive)
      vim.api.nvim_create_user_command('G', function()
        neogit.open()
      end, {})
    end,
  },
  { -- gutters, hunks
    'lewis6991/gitsigns.nvim',
    ---@type Gitsigns.Config
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
        map('n', '<leader>hu', gitsigns.undo_stage_hunk, { desc = 'git [u]ndo stage hunk' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        map('n', '<leader>hD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })
        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        map('n', '<leader>tD', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
