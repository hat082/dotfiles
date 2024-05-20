local keymap = vim.keymap
-- leader and localleader options
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Open Neovim config directory
keymap.set("n", "<leader>ec", ":e ~/.config/nvim/<CR>", { noremap = true, silent = true, desc = { "Edit Config" } })
keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
keymap.set("n", "<leader>q", ":wqa!<CR>", {desc = {"Write all and quit"}})

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

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- nvim notify

