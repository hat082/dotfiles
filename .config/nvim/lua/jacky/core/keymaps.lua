local keymap = vim.keymap
-- leader and localleader options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.api.nvim_set_keymap("n", "<F5>", ":cd build/; make ./test<CR>", { noremap = true, silent = true })
--
--
-- Open Neovim config directory
keymap.set("n", "<leader>ec", ":e ~/.config/nvim/<CR>", { noremap = true, silent = true, desc = { "Edit Config" } })

-- Diagnostic keymaps

keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Window Management
keymap.set("n", "<leader>pv", "<C-w>v", { desc = "Split Pane Vertically" })
keymap.set("n", "<leader>ph", "<C-w>s", { desc = "Split Pane Horizontally" })
keymap.set("n", "<leader>pe", "<C-w>=", { desc = "Make Pane Equal Size" })
keymap.set("n", "<leader>px", "<cmd>close<CR>", { desc = "Close Current Pane" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

