return {
  "saghen/blink.cmp",
  dependecies = {
    "jsongerber/nvim-px-to-rem",
  },
  opts = {
    sources = {
      default = { "nvim-px-to-rem", "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        snippets = {
          score_offset = 100,
        },
        ["nvim-px-to-rem"] = {
          module = "nvim-px-to-rem.integrations.blink",
          name = "nvim-px-to-rem",
        },
        lsp = {
          score_offset = 50,
          override = {
            -- get_trigger_characters = function(self)
            --   local chars = self:get_trigger_characters()
            --   return vim.tbl_filter(function(c)
            --     return not vim.tbl_contains({ "{", "(", "[", "}", ")", "]" }, c)
            --   end, chars)
            -- end,
            get_trigger_characters = function(self)
              local chars = self:get_trigger_characters()
              if vim.bo.filetype == "scss" then
                vim.list_extend(chars, { "$" })
                return vim.tbl_filter(function(c)
                  return not vim.tbl_contains({ "{", "(", "[", "}", ")", "]" }, c)
                end, chars)
              end
              return chars
            end,
          },
        },
      },
    },
    snippets = {
      preset = "luasnip",
    },
    keymap = {
      ["<Tab>"] = {},
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },
  },
}
