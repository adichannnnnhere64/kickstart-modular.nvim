return {
  {
    'gbprod/phpactor.nvim',
    ft = 'php',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'neovim/nvim-lspconfig',
      -- If the update/install notification doesn't show properly,
      -- you should also add here UI plugins like "folke/noice.nvim" or "stevearc/dressing.nvim"
    },
    opts = {
      -- you're options goes here
    },
    keys = {
      {
        '<leader>am',
        '<cmd>:PhpActor move_class<cr>',
        desc = 'Move Class',
      },

      {
        '<leader>aim',
        '<cmd>:PhpActor import_missing_classes<cr>',
        desc = 'Import Missing Classes',
      },

      {
        '<leader>aic',
        '<cmd>:PhpActor import_class<cr>',
        desc = 'Import Classes',
      },
    },
  },
}
