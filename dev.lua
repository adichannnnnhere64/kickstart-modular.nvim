local buragnot = { 'adrian', 'radores', 'panginoon' }

if buragnot[1] == 'adrian' then
  vim.notify 'Hoy ikay ba siiiiiiiiiiiiiiiiiii... Adriann tangaa'
end

for i, v in ipairs(buragnot) do
  vim.print(v)
end

