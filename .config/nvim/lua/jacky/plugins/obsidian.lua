return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    -- "godlygeek/tabular",
    -- "preservim/vim-markdown",
  },

  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "/mnt/c/Users/jacky/OneDrive - The University of Nottingham Ningbo China/Obsidian",
        },
      },
      notes_subdir = "nvim-inbox",
      new_notes_location = "notes_subdir",
      mappings = {
        ["gd"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      }
    })

    vim.g["vim_markdown_no_default_key_mappings "] = 1
  end
}
