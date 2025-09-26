return {
  {
    'nvim-neotest/neotest',
    -- lazy = true,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      --
      'marilari88/neotest-vitest',
      'V13Axel/neotest-pest',
      'olimorris/neotest-phpunit',
    },
    config = function()
      require('neotest').setup {
        log_level = vim.log.levels.DEBUG,
        adapters = {
          require 'neotest-pest',
          require 'neotest-vitest',
          require 'neotest-java',
          require 'neotest-phpunit' {
            root_ignore_files = { 'tests/Pest.php' },
          },
        },
      }

      vim.keymap.set('n', '<leader>tn', function()
        require('neotest').run.run()
      end, { desc = 'Run test' })
      vim.keymap.set('n', '<leader>ta', function()
        require('neotest').run.run(vim.fn.expand '%')
      end, { desc = 'Run All test' })
      vim.keymap.set('n', '<leader>ts', '<cmd>Neotest summary<CR>', { desc = 'Run test summary' })
    end,
  },
}
