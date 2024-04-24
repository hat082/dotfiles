return {
	{
		-- collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- better around/inside textobjects
			--
			-- examples:
			--  - va)  - [v]isually select [a]round [)]paren
			--  - yinq - [y]ank [i]nside [n]ext [']quote
			--  - ci'  - [c]hange [i]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [s]urround [a]dd [i]nner [w]ord [)]paren
			-- - sd'   - [s]urround [d]elete [']quotes
			-- - sr)'  - [s]urround [r]eplace [)] [']
			require("mini.surround").setup()

			require("mini.indentscope").setup({})

			require("mini.cursorword").setup({})
		end,
	},
}