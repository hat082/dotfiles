return {
	"folke/noice.nvim",
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup()
		require("notify").setup({
			stages = "static",
			background_colour = "#000000",
			fps = 5,
			timeout = 5000,
			render = "compact",
			max_width = 50,
		})
	end,
}
