return {
  "alex-popov-tech/store.nvim",
  dependencies = { "OXY2DEV/markview.nvim" },

  keys = {
    {
      '<leader>pm',
      function()
        require('store').toggle()
      end,
      desc = 'Toggle Store mode',
    },
  },
  opts = {},
  cmd = "Store"
}
