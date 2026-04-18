return {
  { "mg979/vim-visual-multi" },
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
    end,
  },
  {
    "Goose97/timber.nvim",
    version = "*",
    event = "VeryLazy",
    config = true,
  },
  {
    "jsongerber/nvim-px-to-rem",
    config = true,
    --If you need to set some options replace the line above with:
    -- config = function()
    --     require('nvim-px-to-rem').setup()
    -- end,
  },
}
