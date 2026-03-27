return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = false, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- format_on_save = function(bufnr)
      --   local ft = vim.bo[bufnr].filetype
      --   if ft == 'http' or ft == 'rest' then
      --     return { timeout_ms = 1000, lsp_format = 'fallback' }
      --   end
      -- end,
      formatters_by_ft = {
        lua = { 'stylua' },
        php = { 'pint' },
        yaml = { 'yamlfix' },
        http = { 'kulala-fmt' },
        html = { 'prettier' },
        json = { 'biome' },
        java = { 'google-java-format' },
        yml = { 'yamlfix' },
        xml = { 'xmlformatter' },
        blade = { 'blade-formatter' },
        javascript = { 'prettierd', 'prettier', stop_after_first = true },
        typescript = { 'prettierd', 'prettier', stop_after_first = true },
      },
    },
  },
}
