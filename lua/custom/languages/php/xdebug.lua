vim.api.nvim_create_autocmd('FileType', {
  pattern = 'php',
  callback = function()
    local dap = require 'dap'

    if dap.adapters.php then
      return -- already configured
    end

    dap.adapters.php = {
      type = 'executable',
      command = 'node',
      args = { vim.fn.stdpath 'data' .. '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
    }

    dap.configurations.php = {
      {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        breakpoints = {
          exception = {
            Notice = false,
            Warning = false,
            Error = false,
            Exception = false,
            ['*'] = false,
          },
        },
        pathMappings = {
          ['/var/www/html'] = '${workspaceFolder}',
        },
        -- hostname = '0.0.0.0',
        timeout = 30000,
      },
    }

    -- vim.notify('PHP debugging ready!', vim.log.levels.INFO)
  end,
  once = true,
})

return {}
