local function is_laravel_project()
  local root = vim.fn.getcwd()
  local markers = { 'artisan', 'composer.json', 'bootstrap/app.php' }
  for _, marker in ipairs(markers) do
    if vim.fn.isdirectory(root .. '/' .. marker) == 1 or vim.fn.filereadable(root .. '/' .. marker) == 1 then
      return true
    end
  end
  return false
end

return {
  {
    'adibhanna/laravel.nvim',
    lazy = true,
    cond = not vim.fn.empty(vim.fn.globpath(vim.fn.getcwd(), 'artisan', 1)),
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
    },
    ft = { 'php', 'blade', 'twig' },
    keys = {
      { '<leader>lc', '<cmd>Composer<cr>', desc = 'Composer' },
      { '<leader>lde', '<cmd>LaravelDumpsEnable<cr>', desc = 'Enable Laravel Dumps' },
      { '<leader>ldv', '<cmd>LaravelDumps<cr>', desc = 'View Laravel Dumps' },
      { '<leader>lr', '<cmd>LaravelRoute<cr>', desc = 'List Laravel Routes' },
      { '<leader>lm', '<cmd>LaravelMake<cr>', desc = 'Laravel Make' },
    },
    config = function()
      require('laravel').setup {
        sail = {
          enabled = false,
          auto_detect = false,
        },
      }
    end,
  },
}
