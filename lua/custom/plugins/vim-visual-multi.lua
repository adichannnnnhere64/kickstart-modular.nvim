return {
  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    keys = {
      -- When any of these keys are pressed, the plugin will load
      { '<up>', mode = { 'n', 'x' } },
      { '<down>', mode = { 'n', 'x' } },
      { '<leader><up>', mode = { 'n', 'x' } },
      { '<leader><down>', mode = { 'n', 'x' } },
      { '<leader>n', mode = { 'n', 'x' } },
      { '<leader>s', mode = { 'n', 'x' } },
      { '<leader>N', mode = { 'n', 'x' } },
      { '<leader>S', mode = { 'n', 'x' } },
      { '<c-q>', mode = { 'n', 'x' } },
      { '<c-leftmouse>', mode = 'n' },
      { '<c-leftdrag>', mode = 'n' },
      { '<c-leftrelease>', mode = 'n' },
    },
    config = function()
      local mc = require 'multicursor-nvim'
      mc.setup()

      local set = vim.keymap.set
      set({ 'n', 'x' }, '<up>', function()
        mc.lineAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<down>', function()
        mc.lineAddCursor(1)
      end)
      set({ 'n', 'x' }, '<leader><up>', function()
        mc.lineSkipCursor(-1)
      end)
      set({ 'n', 'x' }, '<leader><down>', function()
        mc.lineSkipCursor(1)
      end)

      set({ 'n', 'x' }, '<leader>n', function()
        mc.matchAddCursor(1)
      end)
      set({ 'n', 'x' }, '<leader>s', function()
        mc.matchSkipCursor(1)
      end)
      set({ 'n', 'x' }, '<leader>N', function()
        mc.matchAddCursor(-1)
      end)
      set({ 'n', 'x' }, '<leader>S', function()
        mc.matchSkipCursor(-1)
      end)

      set('n', '<c-leftmouse>', mc.handleMouse)
      set('n', '<c-leftdrag>', mc.handleMouseDrag)
      set('n', '<c-leftrelease>', mc.handleMouseRelease)
      set({ 'n', 'x' }, '<c-q>', mc.toggleCursor)

      mc.addKeymapLayer(function(layerSet)
        layerSet({ 'n', 'x' }, '<left>', mc.prevCursor)
        layerSet({ 'n', 'x' }, '<right>', mc.nextCursor)
        layerSet({ 'n', 'x' }, '<leader>x', mc.deleteCursor)
        layerSet('n', '<esc>', function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)

      local hl = vim.api.nvim_set_hl
      hl(0, 'MultiCursorCursor', { reverse = true })
      hl(0, 'MultiCursorVisual', { link = 'Visual' })
      hl(0, 'MultiCursorSign', { link = 'SignColumn' })
      hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
      hl(0, 'MultiCursorDisabledCursor', { reverse = true })
      hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
      hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
    end,
  },
}
