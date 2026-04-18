return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",
  opts = function(_, opts)
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim-lazy/my_snippets") },
    })
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.expand("~/.config/nvim-lazy/my_snippets") },
    })
  end,
}
