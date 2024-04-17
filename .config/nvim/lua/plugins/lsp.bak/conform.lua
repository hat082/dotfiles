return { -- autoformat
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. you can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = {}
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			-- conform can also run multiple formatters sequentially
			-- python = { "isort", "black" },
			--
			-- you can use a sub-list to tell conform to run *until* a formatter
			-- is found.
			-- javascript = { { "prettierd", "prettier" } },
		},
	},
}
