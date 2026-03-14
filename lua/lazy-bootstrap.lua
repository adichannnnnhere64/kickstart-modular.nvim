-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
local lazyinit = lazypath .. '/lua/lazy/init.lua'

local function lazy_installed()
  return (vim.uv or vim.loop).fs_stat(lazyinit) ~= nil
end

if not lazy_installed() then
  if (vim.uv or vim.loop).fs_stat(lazypath) ~= nil then
    vim.fn.delete(lazypath, 'rf')
  end
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
  if not lazy_installed() then
    error('lazy.nvim clone incomplete: missing ' .. lazyinit)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- vim: ts=2 sts=2 sw=2 et
