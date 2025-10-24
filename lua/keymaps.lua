local opts = { noremap = true, silent = true }
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
--
-- escape when pressed jk.
vim.keymap.set('i', 'jk', '<ESC>')
-- escape on terminal using jk
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], { noremap = true })

-- move code via visual selection up or down using shift + j/k
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

vim.keymap.set('n', '<leader>nt', '<cmd>tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'H', '<cmd>tabprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '<cmd>tabnext<CR>', { noremap = true, silent = true })

-- Resize with arrows
vim.keymap.set('n', '<C-S-Down>', ':resize +2<CR>', { desc = 'Resize Horizontal Split Down' })
vim.keymap.set('n', '<C-S-Up>', ':resize -2<CR>', { desc = 'Resize Horizontal Split Up' })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { desc = 'Resize Vertical Split Down' })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { desc = 'Resize Vertical Split Up' })

-- Copy file paths

vim.keymap.set('n', '<leader>cf', '<cmd>let @+ = expand("%")<CR>', { desc = 'Copy File Name' })
vim.keymap.set('n', '<leader>cp', '<cmd>let @+ = expand("%:p")<CR>', { desc = 'Copy File Path' })

-- Jump to plugin management file
vim.keymap.set('n', '<leader>gp', '<cmd>e ~/.config/nvim/lua/custom/<CR>', { desc = 'Jump to configuration file' })

vim.keymap.set('n', '<leader>rw', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word under cursor' })

vim.api.nvim_set_keymap('n', '<C-c>', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

vim.keymap.set('n', '<C-a>', 'ggVG', opts)

vim.keymap.set('n', '<leader>x', function()
  -- clear message history first
  vim.cmd 'messages clear'

  -- capture output from luafile
  local file = vim.fn.expand '%'
  vim.cmd 'redir => g:lua_output'
  vim.cmd('silent! luafile ' .. file)
  vim.cmd 'redir END'

  -- open split and show the captured output
  vim.cmd 'botright 10split'
  vim.cmd 'enew'
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(vim.g.lua_output or '', '\n'))
  vim.cmd 'setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile'
end, { desc = 'Run Lua buffer and show output in split' })
