return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
		config = true,
	},
	{
		"3rd/image.nvim",
		dependencies = { "luarocks.nvim" },
		config = function() end,
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "vhyrro/luarocks.nvim" },
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "/mnt/c/Users/jacky/Desktop/Notes",
							},
							default_workspace = "Notes",
						},
					},
					-- ["core.latex.renderer"] = {},
				},
			})
		end,
	},
}
