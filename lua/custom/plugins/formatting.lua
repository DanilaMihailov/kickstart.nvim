return { -- Autoformat
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
    {
      '<leader>tf',
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
      end,
      mode = '',
      desc = '[T]oggle [F]ormat on Save',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- отключает автоформат для директории kkrm
      if vim.fn.getcwd(-1, -1):find 'kkrm' then
        return false
      end
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      gleam = { 'gleam' },
      toml = { 'taplo' },
      markdown = { 'markdownlint' },
      -- Conform can also run multiple formatters sequentially
      python = function()
        -- ruff only works with python3
        if vim.fn.getcwd(-1, -1):find 'kkrm' then
          return { 'autopep8', 'docformatter', 'isort' }
        else
          return { 'ruff_fix', 'ruff_format' }
        end
      end,
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { { 'prettierd', 'prettier' } },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
