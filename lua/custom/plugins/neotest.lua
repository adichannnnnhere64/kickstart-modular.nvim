return {
  {
    'nvim-neotest/neotest',
    lazy = true,
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      -- 'nvim-treesitter/nvim-treesitter',
      --
      -- 'marilari88/neotest-vitest',
      'V13Axel/neotest-pest',
    },
    cmd = { 'Neotest' },
    ft = { 'php' },
    keys = {
      {
        '<leader>tn',
        function()
          require('neotest').run.run()
        end,
        desc = 'Run nearest test',
      },
      {
        '<leader>tf',
        function()
          require('neotest').run.run(vim.fn.expand '%')
        end,
        desc = 'Run file tests',
      },
      {
        '<leader>ta',
        function()
          require('neotest').run.run { suite = true }
        end,
        desc = 'Run all tests',
      },
      {
        '<leader>ts',
        '<cmd>Neotest summary<CR>',
        desc = 'Test summary',
      },
      {
        '<leader>to',
        '<cmd>Neotest output<CR>',
        desc = 'Test output',
      },
      {
        '<leader>tO',
        '<cmd>Neotest output-panel<CR>',
        desc = 'Test output panel',
      },
    },
    config = function()
      require('neotest').setup {

        adapters = {
          -- Add vitest first
          -- require 'neotest-vitest',

          -- Pest adapter with comprehensive configuration
          require 'neotest-pest' {
            -- Pest command - adjust based on your setup
            pest_cmd = function()
              return 'vendor/bin/pest'
            end,

            -- Sail/Docker configuration
            sail_enabled = function()
              return true -- Enable since you're using Docker
            end,

            -- Your Docker exec command
            sail_executable = { 'docker', 'exec', 'phpx' },

            -- Docker path mapping
            sail_project_path = '/var/www/html',

            -- Test file patterns - make sure your test files match
            test_file_suffixes = { 'Test.php', '_test.php', 'PestTest.php' },

            -- Directories to ignore
            ignore_dirs = { 'vendor', 'node_modules', '.git' },

            -- Results path - accessible by both container and host
            -- results_path = function()
            --   -- Use a path that's shared between container and host
            --   return vim.fn.getcwd() .. '/storage/app/junit-' .. os.date '%Y%m%d-%H%M%S' .. '.xml'
            -- end,

            -- Enable parallel testing (adjust number as needed)
            parallel = 0, -- Start with 0, increase if needed

            -- Enable compact output
            compact = false,

            -- Root pattern detection
            root_pattern = function(path)
              return require('neotest.lib').files.match_root_pattern('composer.json', 'phpunit.xml', 'phpunit.xml.dist', 'pest.php', '.git')(path)
            end,
          },
        },

        -- Discovery settings
        discovery = {
          concurrent = 1,
          enabled = true,
        },

        -- Output settings
        output = {
          enabled = true,
          open_on_run = 'short', -- 'short' | 'long' | false
        },

        -- Output panel settings
        output_panel = {
          enabled = true,
          open = 'botright split | resize 15',
        },

        -- Summary window settings
        summary = {
          enabled = true,
          animated = true,
          follow = true,
          expand_errors = true,
          mappings = {
            attach = 'a',
            clear_marked = 'M',
            clear_target = 'T',
            debug = 'd',
            expand = { '<CR>', '<2-LeftMouse>' },
            expand_all = 'e',
            jumpto = 'i',
            mark = 'm',
            next_failed = 'J',
            output = 'o',
            prev_failed = 'K',
            run = 'r',
            run_marked = 'R',
            short = 'O',
            stop = 'u',
            target = 't',
            watch = 'w',
          },
        },

        -- Status settings
        status = {
          enabled = true,
          signs = true,
          virtual_text = false,
        },

        -- Icons
        icons = {
          child_indent = '│',
          child_prefix = '├',
          collapsed = '─',
          expanded = '╮',
          failed = '✖',
          final_child_indent = ' ',
          final_child_prefix = '╰',
          non_collapsible = '─',
          passed = '✓',
          running = '●',
          running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
          skipped = '○',
          unknown = '?',
        },
      }
    end,
  },
}
