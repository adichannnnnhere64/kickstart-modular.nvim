return {
  {
    'michaelrommel/nvim-silicon',
    config = function()
      require('nvim-silicon').setup {
        background = '#87f',
        debug = false,
        theme = nil,
        wslclipboard = 'auto',
        wslclipboardcopy = 'delete',
      }

      local wk = require 'which-key'
      wk.add {
        mode = { 'v' },
        { '<leader>s', group = 'Silicon' },
        {
          '<leader>sc',
          function()
            require('nvim-silicon').clip()
          end,
          desc = 'Copy code screenshot to clipboard',
        },
        {
          '<leader>sf',
          function()
            require('nvim-silicon').file()
          end,
          desc = 'Save code screenshot as file',
        },
        {
          '<leader>ss',
          function()
            require('nvim-silicon').shoot()
          end,
          desc = 'Create code screenshot',
        },
      }
    end,
  },
}
