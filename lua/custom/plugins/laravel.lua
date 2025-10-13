return {
  {
    'adibhanna/laravel.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>lc', ':Composer<cr>', desc = 'Composer' },
      { '<leader>lde', ':LaravelDumpsEnable<cr>', desc = 'Laravel DumpsEnable' },
      { '<leader>ldv', ':LaravelDumps<cr>', desc = 'Laravel Dumps View' },
      { '<leader>lr', ':LaravelRoute<cr>', desc = 'Laravel Routes' },
      { '<leader>lm', ':LaravelMake<cr>', desc = 'Laravel Make' },
    },
    config = function()
      require('laravel').setup {
        sail = {
          enabled = true,
          auto_detect = true,
        },
      }
    end,
  },
}
