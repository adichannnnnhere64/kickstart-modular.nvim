return {
  {
    "atiladefreitas/dooing",
    lazy = true,
    keys = {
      { "<leader>td", "<cmd>Dooing<cr>", desc = "Toggle Dooing" },
    },
    config = function()
      require("dooing").setup({
      })
    end,
  },
}
