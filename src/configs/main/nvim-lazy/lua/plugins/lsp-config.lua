return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      eslint = {},
      cssls = {},
      somesass_ls = {
        settings = {
          somesass = {
            workspace = {
              loadPaths = { "src" },
            },
            scss = {
              completion = {
                suggestFromUseOnly = true,
              },
            },
          },
        },
      },
      css_variables = {
        filetypes = { "css", "scss" }, -- remove scss/sass/less
      },
    },
    setup = {
      eslint = function()
        vim.api.nvim_create_autocmd("BufWritePre", {
          pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
          callback = function()
            vim.lsp.buf.format({ name = "eslint", async = false })
          end,
        })
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          elseif client.name == "cssls" then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end)
      end,
    },
  },
}
