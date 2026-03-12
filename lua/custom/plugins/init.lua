-- Extra plugin specs can live under `lua/custom/plugins/*.lua`.

local specs = {}

-- Language plugin specs live under `lua/custom/languages/*/init.lua`.
-- Do NOT `{ import = 'custom.languages.*' }` here: that would make Lazy treat
-- every helper module (snippets, utils, etc.) as a plugin spec.

table.insert(specs, require 'custom.languages.java')
vim.list_extend(specs, require 'custom.languages.java.neotest')
table.insert(specs, require 'custom.languages.java.java-creator')

return specs
