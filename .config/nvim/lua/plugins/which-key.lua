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
	{ -- whichkey
		"folke/which-key.nvim",
		event = "vimenter", -- sets the loading event to 'vimenter'
		config = function() -- this is the function that runs, after loading
			require("which-key").setup()

			-- document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[c]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[d]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[r]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[s]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[w]orkspace", _ = "which_key_ignore" },
				["<leader>l"] = { name = "[l]sp", _ = "which_key_ignore" },
				buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
				silent = true, -- use `silent` when creating keymaps
				noremap = true, -- use `noremap` when creating keymaps
				nowait = true, -- use `nowait` when creating keymaps
				prefix = "<leader>",
				mode = { "n", "v" },
				b = { "<cmd>VimtexCompile<CR>", "[B]uild" },
				c = { "<cmd>vert sb<CR>", "[C]reate split" },
				-- k = { "<cmd>clo<CR>", "kill split" },
				d = { "<cmd>update! | bdelete!<CR>", "delete buffer" },
				j = { "<cmd>clo<CR>", "drop split" },
				-- h = { "<cmd>Alpha<CR>", "home" },
				i = { "<cmd>VimtexTocOpen<CR>", "index" },
				k = { "<cmd>on<CR>", "max split" },
				q = { "<cmd>wa! | qa!<CR>", "quit" },
				u = { "<cmd>Telescope undo<CR>", "undo" },
				v = { "<cmd>VimtexView<CR>", "view" },
				w = { "<cmd>wa!<CR>", "write" },
				-- z = { "<cmd>ZenMode<CR>", "zen" },
				a = {
					name = "[A]ctions",
					a = { "<cmd>lua PdfAnnots()<CR>", "annotate" },
					b = { "<cmd>terminal bibexport -o %:p:r.bib %:p:r.aux<CR>", "bib export" },
					c = { "<cmd>:VimtexClearCache All<CR>", "clear vimtex" },
					e = { "<cmd>e ~/.config/nvim/snippets/tex.snippets<CR>", "edit snippets" },
					f = { "<cmd>lua vim.lsp.buf.format()<CR>", "format" },
					g = { "<cmd>e ~/.config/nvim/templates/Glossary.tex<CR>", "edit glossary" },
					-- h = { "<cmd>lua _HTOP_TOGGLE()<CR>", "htop" },
					h = { "<cmd>LocalHighlightToggle<CR>", "highlight" },
					k = { "<cmd>VimtexClean<CR>", "kill aux" },
					-- l = { "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", "LSP" },
					-- m = { "<cmd>MarkdownPreview<CR>", "markdown preview" },
					m = { "<cmd>TermExec cmd='ssh brastmck@eofe10.mit.edu'<CR>", "mit ssh" },
					p = { "<cmd>TermExec cmd='python %:p:r.py'<CR>", "python" },
					-- P = { "<cmd>!python %:p:r.py<CR>", "python" },
					r = { "<cmd>VimtexErrors<CR>", "report errors" },
					u = { "<cmd>cd %:p:h<CR>", "update cwd" },
					v = { "<plug>(vimtex-context-menu)", "vimtex menu" },
					w = { "<cmd>VimtexCountWords!<CR>", "word count" },
					-- w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>" , "word"},
					-- s = { "<cmd>lua function() require('cmp_vimtex.search').search_menu() end<CR>"           , "search citations" },
				},
				-- c = {
				--   name = "CITATION",
				--   t = { "<cmd>Telescope bibtex format_string=\\citet{%s}<CR>", "\\citet" },
				--   p = { "<cmd>Telescope bibtex format_string=\\citep{%s}<CR>", "\\citep" },
				--   s = { "<cmd>Telescope bibtex format_string=\\citepos{%s}<CR>", "\\citepos" },
				-- },
				-- f = {
				-- 	name = "FIND",
				-- 	b = {
				-- 		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<CR>",
				-- 		"buffers",
				-- 	},
				-- 	c = { "<cmd>Telescope bibtex format_string=\\citet{%s}<CR>", "citations" },
				-- 	f = { "<cmd>Telescope live_grep theme=ivy<CR>", "project" },
				-- 	g = { "<cmd>Telescope git_branches<CR>", "branches" },
				-- 	h = { "<cmd>Telescope help_tags<CR>", "help" },
				-- 	k = { "<cmd>Telescope keymaps<CR>", "keymaps" },
				-- 	-- m = { "<cmd>Telescope man_pages<CR>", "man pages" },
				-- 	r = { "<cmd>Telescope registers<CR>", "registers" },
				-- 	t = { "<cmd>Telescope colorscheme<CR>", "theme" },
				-- 	y = { "<cmd>YankyRingHistory<CR>", "yanks" },
				-- 	-- c = { "<cmd>Telescope commands<CR>", "commands" },
				-- 	-- r = { "<cmd>Telescope oldfiles<CR>", "recent" },
				-- },
				-- g = {
				-- 	name = "GIT",
				-- 	-- b = { "<cmd>Telescope git_branches<CR>", "checkout branch" },
				-- 	-- c = { "<cmd>Telescope git_commits<CR>", "checkout commit" },
				-- 	d = { "<cmd>Gitsigns diffthis HEAD<CR>", "diff" },
				-- 	b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "blame" },
				-- 	g = { "<cmd>LazyGit<CR>", "lazygit" },
				-- 	j = { "<cmd>Gitsigns next_hunk<CR>", "next hunk" },
				-- 	k = { "<cmd>Gitsigns prev_hunk<CR>", "prev hunk" },
				-- 	-- o = { "<cmd>Telescope git_status<CR>", "open changed file" },
				-- 	p = { "<cmd>Gitsigns preview_hunk<CR>", "preview hunk" },
				-- 	-- r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "reset hunk" },
				-- 	-- s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "stage hunk" },
				-- 	-- u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "unstage hunk" },
				-- },
				-- h = {
				--   name = "HARPOON",
				--   m = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "mark" },
				--   n = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "next" },
				--   p = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "previous" },
				-- (?) },
				-- -- NEORG LIST MAPPINGS
				-- l = {
				--   name = "LIST",
				--   a = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_ambiguous<CR>", "ambiguous" },
				--   b = { "<cmd>Neorg keybind norg core.promo.demote<CR>", "backwards indent" },
				--   c = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_cancelled<CR>", "cancel" },
				--   d = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_done<CR>", "done" },
				--   f = { "<cmd>Neorg keybind norg core.promo.promote<CR>", "forward indent" },
				--   i = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_important<CR>", "important" },
				--   n = { "<cmd>Neorg keybind norg core.itero.next-iteration<CR>", "new task" },
				--   -- n = { "<cmd>set filetype=norg<CR>", "neorg" },
				--   p = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_pending<CR>", "pending" },
				--   r = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_recurring<CR>", "recurring" },
				--   t = { "<cmd>Neorg toggle-concealer<CR>", "toggle concealer" },
				--   u = { "<cmd>Neorg keybind norg core.qol.todo_items.todo.task_undone<CR>", "undone" },
				--   v = { "<cmd>Neorg keybind norg core.pivot.invert-list-type<CR>", "invert list" },
				--   -- t = { "<cmd>Neorg keybind norg core.pivot.toggle-list-type<CR>", "toggle list" },
				-- },
				-- LIST MAPPINGS
				L = {
					name = "[L]SP",
					b = { "<cmd>Telescope diagnostics bufnr=0<CR>", "buffer diagnostics" },
					c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
					d = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
					D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
					h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "help" },
					i = { "<cmd>Telescope lsp_implementations<CR>", "implementations" },
					k = { "<cmd>LspStop<CR>", "kill lsp" },
					l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "line diagnostics" },
					n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic" },
					p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic" },
					r = { "<cmd>Telescope lsp_references<CR>", "references" },
					s = { "<cmd>LspRestart<CR>", "restart lsp" },
					t = { "<cmd>LspStart<CR>", "start lsp" },
					R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
					T = { "<cmd>Telescope lsp_type_definitions<CR>", "type definition" },
				},
				-- MARKDOWN MAPPINGS
				-- m = {
				-- 	name = "MARKDOWN",
				-- 	v = { "<cmd>Slides<CR>", "view slides" },
				-- },
				-- S = {
				-- 	name = "SESSIONS",
				-- 	s = { "<cmd>SessionManager save_current_session<CR>", "save" },
				-- 	d = { "<cmd>SessionManager delete_session<CR>", "delete" },
				-- 	l = { "<cmd>SessionManager load_session<CR>", "load" },
				-- },
				-- p = {
				-- 	name = "PANDOC",
				-- 	w = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.docx'<CR>", "word" },
				-- 	m = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.md'<CR>", "markdown" },
				-- 	h = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.html'<CR>", "html" },
				-- 	l = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.tex'<CR>", "latex" },
				-- 	p = { "<cmd>TermExec cmd='pandoc %:p -o %:p:r.pdf' open=0<CR>", "pdf" },
				-- 	v = { "<cmd>TermExec cmd='zathura %:p:r.pdf &' open=0<CR>", "view" },
				-- 	-- x = { "<cmd>echo "run: unoconv -f pdf path-to.docx""  , "word to pdf"},
				-- },
				t = {
					name = "[T]emplates",
					p = {
						"<cmd>read ~/.config/nvim/templates/PhilPaper.tex<CR>",
						"PhilPaper.tex",
					},
					l = {
						"<cmd>read ~/.config/nvim/templates/Letter.tex<CR>",
						"Letter.tex",
					},
					g = {
						"<cmd>read ~/.config/nvim/templates/Glossary.tex<CR>",
						"Glossary.tex",
					},
					h = {
						"<cmd>read ~/.config/nvim/templates/HandOut.tex<CR>",
						"HandOut.tex",
					},
					b = {
						"<cmd>read ~/.config/nvim/templates/PhilBeamer.tex<CR>",
						"PhilBeamer.tex",
					},
					s = {
						"<cmd>read ~/.config/nvim/templates/SubFile.tex<CR>",
						"SubFile.tex",
					},
					r = {
						"<cmd>read ~/.config/nvim/templates/Root.tex<CR>",
						"Root.tex",
					},
					m = {
						"<cmd>read ~/.config/nvim/templates/MultipleAnswer.tex<CR>",
						"MultipleAnswer.tex",
					},
				},
			})
		end,
	},
}
