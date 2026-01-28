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
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.winborder = "rounded"
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"
vim.opt.showmode = false

vim.g.mapleader = " "
vim.g.netrw_banner = false
vim.g.netrw_keepdir = false

vim.keymap.set("n", "<leader>e", function() vim.cmd("Exp!") end)
vim.keymap.set("n", "<leader>s", function() vim.cmd("Sex!") end)
vim.keymap.set("n", "<leader>h", function() vim.cmd("Hex!") end)
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("n", "<C-h>", "<C-W><C-h>")
vim.keymap.set("n", "<C-l>", "<C-W><C-l>")
vim.keymap.set("n", "<C-j>", "<C-W><C-j>")
vim.keymap.set("n", "<C-k>", "<C-W><C-k>")

vim.keymap.set("n", "<A-h>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", "<CMD>vertical resize +2<CR>")
vim.keymap.set("n", "<A-k>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<A-j>", "<CMD>resize +2<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({
		higroup = "Visual",
		timeout = 45
	})
    end,
})
