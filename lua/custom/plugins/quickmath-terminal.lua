local math_win = nil
local math_buf = nil
function ToggleInlineMath()
  -- Close if already open
  if math_win and vim.api.nvim_win_is_valid(math_win) then
    vim.api.nvim_win_close(math_win, true)
    math_win = nil
    math_buf = nil
    return
  end
  -- Create scratch buffer
  math_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(math_buf, 'buftype', 'prompt')
  vim.api.nvim_buf_set_option(math_buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(math_buf, 'filetype', 'lua') -- optional
  -- Floating window dimensions
  local width = math.floor(vim.o.columns * 0.5)
  local height = math.floor(vim.o.lines * 0.3)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)
  math_win = vim.api.nvim_open_win(math_buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })
  -- Set up prompt for input
  vim.fn.prompt_setprompt(math_buf, 'Calc> ')
  vim.fn.prompt_setcallback(math_buf, function(input)
    if input:match '^%s*$' then
      return
    end
    local ok, result = pcall(load('return ' .. input))
    local line_nr = vim.fn.line '.' -- current prompt line
    if ok and result ~= nil then
      vim.api.nvim_buf_set_lines(math_buf, line_nr - 1, line_nr, false, { input .. ' = ' .. tostring(result) })
    else
      vim.api.nvim_buf_set_lines(math_buf, line_nr - 1, line_nr, false, { input .. ' = Error' })
    end
    -- Mark buffer as not modified
    vim.api.nvim_buf_set_option(math_buf, 'modified', false)
    -- Move cursor to the next empty line
    local new_line = vim.api.nvim_buf_line_count(math_buf) + 1
    vim.api.nvim_buf_set_lines(math_buf, new_line - 1, new_line - 1, false, { '' }) -- add empty line
    vim.api.nvim_win_set_cursor(math_win, { new_line, 0 })
  end)
  -- Mark initial buffer as not modified
  vim.api.nvim_buf_set_option(math_buf, 'modified', false)
end
-- Map toggle key
vim.keymap.set('n', '<leader>qm', ToggleInlineMath, { noremap = true, silent = true })
return {}
