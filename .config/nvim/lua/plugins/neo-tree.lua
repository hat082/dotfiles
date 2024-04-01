return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<leader>ee", ":Neotree toggle filesystem left<CR>", { noremap = true, silent = true })
		require("neo-tree").setup({
			auto_close = true,
			diagnostics = {
				enable = true,
			},
			window = {
				position = "left",
				width = 35,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					-- Custom mappings for the tree window
					["h"] = "close_node",
					["l"] = "open",
					["<CR>"] = "open",
				},
			},
		})
	end,
}
