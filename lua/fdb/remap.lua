-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ld", vim.cmd.Ex)

vim.g.maplocalleader = '\\'
vim.opt.timeoutlen = 900

vim.keymap.set("n", "<Tab>", "<C-w>")


