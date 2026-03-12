return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          'Exafunction/codeium.nvim',
          {
            'rafamadriz/friendly-snippets',
            event = 'InsertEnter',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        config = function()
          local ls = require 'luasnip'

          vim.keymap.set({ 'i', 's' }, '<Tab>', function()
            if ls.expand_or_jumpable() then
              ls.expand_or_jump()
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n')
            end
          end, { silent = true })

          vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
            if ls.jumpable(-1) then
              ls.jump(-1)
            else
              vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n')
            end
          end, { silent = true })

          pcall(require, 'custom.snippets')
        end,
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = function()
      local has_laravel = pcall(require, 'laravel.blink_source')

      local default_sources = { 'lsp', 'path', 'snippets', 'lazydev' }
      if has_laravel then
        table.insert(default_sources, 'laravel')
      end

      local providers = {
        lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
      }
      if has_laravel then
        providers.laravel = { name = 'laravel', module = 'laravel.blink_source' }
      end

      return {
        enabled = function()
          local ft = vim.bo.filetype
          local bt = vim.bo.buftype
          local name = vim.api.nvim_buf_get_name(0)

          if ft == 'oil' or bt ~= '' or name == '' then
            return false
          end

          return true
        end,
        keymap = {
          preset = 'enter',
          ['<Tab>'] = { 'select_next', 'fallback' },
          ['<S-Tab>'] = { 'select_prev', 'fallback' },
          ['<C-k>'] = { 'show_documentation', 'fallback' },
          ['<C-l>'] = { 'show', 'fallback' },
          ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
          ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
        },
        appearance = {
          nerd_font_variant = 'mono',
        },
        completion = {
          documentation = { auto_show = false, auto_show_delay_ms = 500 },
        },
        sources = {
          default = default_sources,
          providers = providers,
        },
        snippets = { preset = 'luasnip' },
        fuzzy = { implementation = 'lua' },
        signature = { enabled = true },
      }
    end,
  },
}
