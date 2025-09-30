return {
  {
    -- Plugin
    'stevearc/oil.nvim',
    lazy = false,

    -- Setup
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
    },

    -- Keys
    keys = {
      {
        '-',
        '<CMD>Oil<CR>',
        mode = 'n',
        desc = 'Open parent directory',
      },
    },

    dependencies = {
      { 'echasnovski/mini.icons', opts = {} },
    },
  },
}
