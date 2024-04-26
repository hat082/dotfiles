return {
  -- { -- smoothcursor
  -- 	"gen740/smoothcursor.nvim",
  -- 	config = function()
  -- 		require("smoothcursor").setup({
  -- 			type = "matrix",
  -- 			threshold = 0,
  -- 			matrix = {
  -- 				body = {
  -- 					length = 6,
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },
  {                     -- whichkey
    "folke/which-key.nvim",
    event = "vimenter", -- sets the loading event to 'vimenter'
    config = function() -- this is the function that runs, after loading
      require("which-key").setup()

      -- document existing key chains
      require("which-key").register({
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
        ["<leader>l"] = { name = "[L]sp", _ = "which_key_ignore" },
        buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true,  -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true,  -- use `nowait` when creating keymaps
        prefix = "<leader>",
        mode = { "n", "v" },
        q = { "<cmd>wa! | qa!<CR>", "Write all and quit" },
      })
    end,
  },
}
