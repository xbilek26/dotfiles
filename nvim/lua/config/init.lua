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
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"

vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

vim.keymap.set("n", "<leader>v", vim.cmd.Ex)
vim.keymap.set("n", "<C-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<cr>")
vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-^>", "<C-\\><C-n><C-^>")
vim.keymap.set({"n", "t"}, "<C-h>", "<C-\\><C-n><C-w><C-h>")
vim.keymap.set({"n", "t"}, "<C-l>", "<C-\\><C-n><C-w><C-l>")
vim.keymap.set({"n", "t"}, "<C-j>", "<C-\\><C-n><C-w><C-j>")
vim.keymap.set({"n", "t"}, "<C-k>", "<C-\\><C-n><C-w><C-k>")
vim.keymap.set("n", "<leader>p", function()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.cmd("cclose")
            return
        end
    end
    vim.cmd("copen")
end)

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHiglight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({higroup = "FloatShadow", timeout = 70})
    end,
})
