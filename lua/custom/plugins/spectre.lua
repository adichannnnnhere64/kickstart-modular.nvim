return {
  {
    'nvim-pack/nvim-spectre',
    lazy = true,
    cmd = { 'Spectre' },
    keys = {
      {
        '<leader>sp',
        function()
          require('spectre').toggle()
        end,
        desc = 'Toggle Spectre',
      },
    },
    config = function()
      require('spectre').setup {
        color_devicons = true,
      }
    end,
  },
}
