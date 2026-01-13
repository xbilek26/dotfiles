vim.opt.guicursor = ""
vim.opt.number= true
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
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"

vim.g.mapleader = " "
vim.g.netrw_banner = 0

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })
vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-^>", "<C-[><C-^>")
vim.keymap.set({"n", "t"}, "<C-w>", "<C-\\><C-n><C-w>")
vim.keymap.set({"n", "t"}, "<C-h>", "<C-w><C-h>")
vim.keymap.set({"n", "t"}, "<C-l>", "<C-w><C-l>")
vim.keymap.set({"n", "t"}, "<C-j>", "<C-w><C-j>")
vim.keymap.set({"n", "t"}, "<C-k>", "<C-w><C-k>")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({higroup = "FloatShadow", timeout = 45})
    end,
})
