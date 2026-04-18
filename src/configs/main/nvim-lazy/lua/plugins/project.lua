return {
  "ahmedkhalf/project.nvim",
  opts = {},  -- clear LazyVim's default opts
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern" },
      patterns = {
        "package.json",
        ".git",           -- keep .git as fallback (optional)
      },
      exclude_dirs = {
        "**/node_modules/**",
      },
    })
  end,
}
