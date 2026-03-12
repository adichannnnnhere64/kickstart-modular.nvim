return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  branch = 'main',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  init = function()
    vim.g.no_plugin_maps = true  -- disable default mappings
  end,
  config = function()
    local ts_textobjects = require('nvim-treesitter-textobjects')

    ts_textobjects.setup {
      move = {

        enable = true,
        set_jumps = true,  -- allows using `<C-o>` to jump back
        -- NEXT / PREVIOUS START positions
        goto_next_start = {
          [']f'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']F'] = '@function.outer',
          [']['] = '@class.outer',
        },

        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      select = {
        lookahead = true,
        selection_modes = {
          ['@parameter.outer'] = 'v',

          ['@function.outer'] = 'V',
          ['@class.outer'] = 'V',
        },
        include_surrounding_whitespace = false,
      },
    }

    -- OPTIONAL: textobject selections
    local ts_select = require('nvim-treesitter-textobjects.select')
    vim.keymap.set({ 'x', 'o' }, 'af', function() ts_select.select_textobject('@function.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'if', function() ts_select.select_textobject('@function.inner', 'textobjects') end)

    vim.keymap.set({ 'x', 'o' }, 'ac', function() ts_select.select_textobject('@class.outer', 'textobjects') end)
    vim.keymap.set({ 'x', 'o' }, 'ic', function() ts_select.select_textobject('@class.inner', 'textobjects') end)
  end,
}
