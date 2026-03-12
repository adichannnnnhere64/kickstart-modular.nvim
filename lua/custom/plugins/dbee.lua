return {
  'kndndrj/nvim-dbee',
  cmd = { "Dbee", "DbeeToggle" },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup(--[[optional config]])
  end,
}
