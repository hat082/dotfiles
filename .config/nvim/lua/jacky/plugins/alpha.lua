return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		startify.section.bottom_buttons.val = {
			startify.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		startify.section.footer.val = {
			{ type = "text", val = "Don't Spend All Your Time on Config" },
		}

		-- Disable MRU section
		startify.section.mru.val = { { type = "padding", val = 0 } }

		-- Set menu
		startify.section.top_buttons.val = {
			startify.button("e", " > New File", "<cmd>ene<CR>"),
			startify.button("SPC ee", " > Toggle File Explorer"),
			startify.button("SPC sf", " > Find File", "<cmd>Telescope find_files<CR>"),
			startify.button("SPC sg", " > Find Word", "<cmd>Telescope live_grep<CR>"),
			startify.button("SPC ec", " > Edit Config Files"),
		}

		-- Send config to alpha
		alpha.setup(startify.config)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
