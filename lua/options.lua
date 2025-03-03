vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.opt.termguicolors = true

vim.opt.softtabstop = 3
vim.opt.tabstop = 3
vim.opt.shiftwidth = 3
vim.opt.expandtab = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.hidden = true
vim.opt.undofile = true

vim.opt.wrap = false
vim.opt.scrolloff = 4

vim.diagnostic.config({ virtual_text = true, underline = false })
