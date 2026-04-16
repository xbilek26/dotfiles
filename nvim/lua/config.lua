vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"
vim.opt.showmode = false
vim.opt.makeprg = ""

vim.g.mapleader = " "
vim.g.netrw_banner = false

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("t", "<c-[>", "<c-\\><c-n>")
vim.keymap.set({"n", "v"}, "<c-h>", "<c-w>h")
vim.keymap.set({"n", "v"}, "<c-l>", "<c-w>l")
vim.keymap.set({"n", "v"}, "<c-j>", "<c-w>j")
vim.keymap.set({"n", "v"}, "<c-k>", "<c-w>k")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 35 })
    end,
})
