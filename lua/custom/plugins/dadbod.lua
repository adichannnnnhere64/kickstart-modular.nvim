return {
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dotenv",                          -- optional
      "tpope/vim-dadbod",                          -- core dadbod
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } }, -- SQL completion
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
      "DBUIRenameBuffer",
      "DBUILastQueryInfo",
    },
    init = function()
      -- UI settings
      vim.g.db_ui_use_nerd_fonts = 1
      vim.g.db_ui_winwidth = 30
      vim.g.db_ui_show_help = 0
      vim.g.db_ui_use_nvim_notify = 1
      vim.g.db_ui_win_position = "left"

      -- Keymaps using which-key
      local wk = require("which-key")
      wk.register({
        ["<leader>D"] = {
          name = "󰆼 Db Tools",
          u = { "<cmd>DBUIToggle<cr>", "DB UI Toggle" },
          f = { "<cmd>DBUIFindBuffer<cr>", "DB UI Find Buffer" },
          r = { "<cmd>DBUIRenameBuffer<cr>", "DB UI Rename Buffer" },
          l = { "<cmd>DBUILastQueryInfo<cr>", "DB UI Last Query Info" },
        },
      })
    end,
  },
}

