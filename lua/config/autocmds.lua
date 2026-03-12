local api = vim.api

api.nvim_create_autocmd('LspAttach', {
  group = api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('gvd', function()
      vim.diagnostic.open_float(nil, { focusable = true })
    end, 'Focus Diagnostic')

    -- map('<C-k>', function()
    --   vim.diagnostic.open_float(nil, { focusable = true })
    -- end, 'Focus Diagnostic')

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    -- map('<S-j>', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    -- map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    --

    local function with_snacks_or_fallback(snacks_fn, fallback_fn)
      return function()
        local picker = _G.Snacks and _G.Snacks.picker
        if picker and picker[snacks_fn] then
          return picker[snacks_fn]()
        end
        return fallback_fn()
      end
    end

    map('grd', with_snacks_or_fallback('lsp_definitions', vim.lsp.buf.definition), '[G]oto [D]efinition')
    map('<S-j>', with_snacks_or_fallback('lsp_definitions', vim.lsp.buf.definition), '[G]oto [D]efinition')
    map('grD', with_snacks_or_fallback('lsp_declarations', vim.lsp.buf.declaration), '[G]oto [D]eclaration')
    map('grr', with_snacks_or_fallback('lsp_references', vim.lsp.buf.references), '[G]oto [R]eferences')
  end,
})

-- only show cursor on current buffer
local cursorGrp = api.nvim_create_augroup('CursorLine', { clear = true })
api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  pattern = '*',
  command = 'set cursorline',
  group = cursorGrp,
})
api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, { pattern = '*', command = 'set nocursorline', group = cursorGrp })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('close_with_q', { clear = true }),
  pattern = {
    'PlenaryTestPopup',
    'help',
    'lspinfo',
    'man',
    'notify',
    'qf',
    'neotest-output',
    'neotest-summary',
    'spectre_panel',
    'neotest-output-panel',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
})

return {}
