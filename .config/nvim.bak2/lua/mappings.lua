-- vim.api.nvim_set_keymap("n", "<F5>", ":cd build/; make ./test<CR>", { noremap = true, silent = true })
-- Open Neovim config directory
vim.api.nvim_set_keymap("n", "<leader>ec", ":e ~/.config/nvim/<CR>", { noremap = true, silent = true })
