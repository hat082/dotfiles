vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "

-- Enable relative line numbering
vim.cmd("set number")
vim.cmd("set relativenumber")

-- set system clipboard
vim.o.clipboard = "unnamedplus"

-- ignorecase
vim.o.ignorecase = true

-- Neovim default updatetime is 4000
vim.opt.updatetime = 200
