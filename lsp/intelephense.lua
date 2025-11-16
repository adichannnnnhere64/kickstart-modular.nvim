local blink = require 'blink.cmp'

return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php', 'blade' },
  root_markers = { 'composer.json', '.git' },
  settings = {
    intelephense = {
      environment = {
        includePaths = {
          'app-modules', -- Your custom modules path
          'Modules', -- Standard InterNACHI path
          'modules', -- Alternative common path
        },
      },
      files = {
        associations = { '*.php' },
        exclude = {
          '**/vendor/**/tests',
          '**/vendor/**/Test',
          '**/node_modules/**',
        },
      },
    },
  },
}
