return {
  {
    'adibhanna/laravel.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
    },
    ft = { 'php', 'blade', 'twig' },
    keys = {
      { '<leader>lc', '<cmd>Composer<cr>', desc = 'Composer' },
      { '<leader>lde', '<cmd>LaravelDumpsEnable<cr>', desc = 'Enable Laravel Dumps' },
      { '<leader>ldv', '<cmd>LaravelDumps<cr>', desc = 'View Laravel Dumps' },
      { '<leader>lr', '<cmd>LaravelRoute<cr>', desc = 'List Laravel Routes' },
      { '<leader>lm', '<cmd>LaravelMake<cr>', desc = 'Laravel Make' },
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
