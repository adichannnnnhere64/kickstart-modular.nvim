return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = function(term)
          if term.direction == 'horizontal' then
            return 15 -- height of horizontal split
          elseif term.direction == 'vertical' then
            return math.floor(vim.o.columns * 0.4) -- 40% of screen width
          end
        end,
        open_mapping = [[<C-/>]],
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        persist_size = true,
        direction = 'horizontal', -- could be "vertical" | "float" too
      }

      -- Normal + terminal mode toggle
      vim.keymap.set({ 'n', 't' }, '<C-\\>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })

      -- Terminal shortcuts
      for i = 1, 3 do
        vim.keymap.set('n', '<leader>t' .. i, function()
          require('toggleterm').toggle(i)
        end, { noremap = true, silent = true, desc = 'Toggle terminal ' .. i })
      end
    end,
  },
}
