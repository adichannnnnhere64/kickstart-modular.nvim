return {
  'sontungexpt/witch-line',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  lazy = false,


  opts = {
    statusline = {
      global = {
        'mode',
        {
          id = 'file.fullpath',
          inherit = 'file.name',  -- Inherit all fields
          update = function(self, ctx, static, session_id)
            return vim.fn.expand '%:p'
          end,
        },
        'git.branch',
        '%=',
        'cursor.pos',
      },
    },

    cache = {
      enabled = false,
    },
  },
}
