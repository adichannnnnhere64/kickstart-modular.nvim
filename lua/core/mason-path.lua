local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local current_path = vim.env.PATH or ""

local path_entries = vim.split(current_path, ":")
local clean_path_entries = {}
local seen = {}

for _, entry in ipairs(path_entries) do
    if entry ~= mason_bin and entry ~= "" and not seen[entry] then
        seen[entry] = true
        table.insert(clean_path_entries, entry)
    end
end

local new_path = mason_bin .. ":" .. table.concat(clean_path_entries, ":")
vim.env.PATH = new_path

if vim.fn.isdirectory(mason_bin) == 0 then
    -- Mason not installed yet, create placeholder
    vim.fn.mkdir(mason_bin, "p")
end

return {

}
