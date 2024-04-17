return {
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd.colorscheme("nightfly")
			-- local noice = require("noice")
			-- noice.setup({
			-- 	presets = {
			-- 		lsp_doc_border = true,
			-- 	},
			-- })
			-- nightfly background and foreground colors in Neovim command line
			local winhighlight = {
				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
			}

			-- setup cmp
			local cmp = require("cmp")
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(winhighlight),
					documentation = cmp.config.window.bordered(winhighlight),
				},
			})
		end,
	},
}
