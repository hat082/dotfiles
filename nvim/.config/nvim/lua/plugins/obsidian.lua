return {
  "epwalsh/obsidian.nvim",
  requires = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "FURP",
          path = "/mnt/c/Users/jacky/FURP_LOG/",
          strict = true,
        },
        -- {
        --   name = "personal",
        --   path = "~/vaults/personal",
        -- },
        -- {
        --   name = "work",
        --   path = "~/vaults/work",
        -- },
      },

      -- see below for full list of options 👇
    })
  end,
}
