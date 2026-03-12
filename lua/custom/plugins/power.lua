return {
  'axsaucedo/neovim-power-mode',

  keys = {
    {
      '<leader>pm',
      function()
        require('power-mode').toggle()
      end,
      desc = 'Toggle Power Mode',
    },
  },

  config = function()
    require('power-mode').setup {
      auto_enable = false,
      cancel_on_new = true,
      max_particles = 10000,

      particles = {
        preset = 'stars',

        -- EXTREME particle count
        count = { 500, 700 },

        -- High velocity for the "swing"
        speed = { 30, 60 },

        -- Longer lifetime so the cloud persists
        lifetime = { 1500, 2000 },

        -- CHANGED: Low gravity allows particles to spread out horizontally
        -- instead of dropping instantly.

        gravity = 0.08,

        drag = 0.9,

        -- CHANGED: Massive spread range to create a wide "explosion" arc
        -- This covers almost 180 degrees in front/behind.
        spread = { -60.0, 60.0 },

        -- CHANGED: Adds a slight upward push to help the spread visibility
        upward_bias = 2.0,
      },

      shake = {
        mode = 'scroll',
        magnitude = 1,
      },

      fire_wall = {

        enabled = false,
      },

      engine = {
        fps = 60,
        stop_delay = 500,
      },
    }
  end,
}
