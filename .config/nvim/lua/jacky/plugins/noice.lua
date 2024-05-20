return {
  "folke/noice.nvim",
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      -- show @q recording
      routes = {
        {
          view = "notify",
          filter = { event = "msg_showmode" },
        },
      },

      presets = {
        -- show lsp hovering borders
        lsp_doc_border = true,
      },
    })
    require("notify").setup({
      stages = "static",
      background_colour = "#000000",
      fps = 5,
      timeout = 5000,
      render = "wrapped-compact",
      max_width = 100,
    })
    vim.keymap.set("n", "<Esc>", function()
      require("notify").dismiss({ silent = true, pending = true })
    end
    )
  end,
}
