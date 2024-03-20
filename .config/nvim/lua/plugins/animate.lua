-- check https://github.com/gen740/SmoothCursor.nvim for more info

return {
	"gen740/SmoothCursor.nvim",
	config = function()
		require("smoothcursor").setup({
			type = "matrix",
			threshold = 0,
			matrix = {
				body = {
					length = 6,
				},
			},
		})
	end,
}
