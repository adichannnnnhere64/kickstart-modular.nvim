return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
        php = { 'pint' },
        yaml = { 'yamlfix' },
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
