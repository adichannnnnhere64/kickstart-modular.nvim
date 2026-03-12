local M = {}

local function prepend_path(dir)
  if not dir or dir == "" then
    return
  end
  if vim.fn.isdirectory(dir) == 0 then
    pcall(vim.fn.mkdir, dir, "p")
  end
  local current = vim.env.PATH or ""
  local entries = vim.split(current, ":", { plain = true })
  for _, e in ipairs(entries) do
    if e == dir then
      return
    end
  end
  vim.env.PATH = dir .. (current ~= "" and (":" .. current) or "")
end

function M.setup()
  -- Ensure user-local helper binaries are available to pickers/jobs.
  prepend_path(vim.fn.stdpath("config") .. "/bin")
end

return M

