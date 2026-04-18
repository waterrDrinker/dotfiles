return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        style = "terminal",
        on_win = function()
          vim.cmd("stopinsert")
        end,
      },
      auto_insert = false,
    },
    scroll = { enabled = false },
  },
}
