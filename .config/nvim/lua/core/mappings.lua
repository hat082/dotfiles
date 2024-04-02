-- vim.api.nvim_set_keymap("n", "<F5>", ":cd build/; make ./test<CR>", { noremap = true, silent = true })
-- Open Neovim config directory
vim.keymap.set("n", "<leader>ec", ":e ~/.config/nvim/<CR>", { noremap = true, silent = true, desc = { "Edit Config" } })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
