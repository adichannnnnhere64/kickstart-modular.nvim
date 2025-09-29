return {
  'mattn/emmet-vim',
  ft = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'vue', 'blade' },
  init = function()
    vim.g.user_emmet_leader_key = '<C-y>'
  end,
}
