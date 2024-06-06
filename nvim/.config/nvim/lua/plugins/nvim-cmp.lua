return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- TODO: install dependency when connected to internet
    -- "hrsh7th/cmp-emoji",
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }

    -- snippet jumping using "jk"
    opts.mapping = vim.tbl_extend("force", opts.mapping, {
      ["jk"] = cmp.mapping(function(fallback)
        if vim.snippet.active({ direction = 1 }) then
          vim.schedule(function()
            vim.snippet.jump(1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["kj"] = cmp.mapping(function(fallback)
        if vim.snippet.active({ direction = -1 }) then
          vim.schedule(function()
            vim.snippet.jump(-1)
          end)
        else
          fallback()
        end
      end, { "i", "s" }),
    })
  end,
}
