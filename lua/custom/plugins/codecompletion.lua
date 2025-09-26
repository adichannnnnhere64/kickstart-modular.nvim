return {
  {
    -- Plugin
    'monkoose/neocodeium',
    event = 'VeryLazy',

    -- Setup
    config = function()
      require('neocodeium').setup()
    end,

    -- Keymaps
    keys = {
      {
        '<C-g>',
        function()
          require('neocodeium').accept()
        end,
        mode = 'i',
        desc = 'Accept completion',
      },
    },
  },
}
