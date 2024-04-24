return {
	"smoka7/hop.nvim",
	config = function()
		local hop = require("hop")
		local directions = require("hop.hint").HintDirection

		hop.setup({
			keys = "dfjk",

			vim.keymap.set("", "f", function()
				hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = 0 })
			end, { remap = true }),
			vim.keymap.set("", "F", function()
				hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 0 })
			end, { remap = true }),

			vim.keymap.set("", "t", function()
				hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false, hint_offset = 2 })
			end, { remap = true }),
			vim.keymap.set("", "T", function()
				hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false, hint_offset = 2 })
			end, { remap = true }),
		})
	end,
}
