vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = { space = "·", tab = "→-" }

vim.cmd([[
    augroup TransparentBackground
    autocmd!
    autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
    autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
    augroup END
]])

require("config.lazy")

