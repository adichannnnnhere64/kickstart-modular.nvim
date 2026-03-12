local ok, ls = pcall(require, 'luasnip')
if not ok then
  return {}
end

-- require all snippet files here
-- require("custom.snippets.lua")
-- require("custom.snippets.php")
require 'custom.snippets.http'

return {}
