-- Entrypoint: keep this file thin and delegate to modules.

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false
vim.o.laststatus = 3
vim.o.fillchars = "eob: "

do
  local deprecate = vim.deprecate
  if type(deprecate) == 'function' then
    vim.deprecate = function(name, alternative, version, plugin, backtrace)
      if name == 'client.request' or (type(name) == 'string' and name:match '^client%.request') then
        return
      end
      return deprecate(name, alternative, version, plugin, backtrace)
    end
  end
end

require('core.path-bootstrap').setup()

require('core.mason-path').setup()

require 'config.options'
require 'config.keymaps'

require 'lazy-bootstrap'

require 'lazy-plugins'

require 'config.settings'

require('core.lsp').setup()
require 'config.autocmds'

-- vim: ts=2 sts=2 sw=2 et
