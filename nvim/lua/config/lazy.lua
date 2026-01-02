-- test test
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

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

vim.g.mapleader = " "
vim.g.have_nerd_font = true
vim.g.netrw_banner = 0

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "auto:1"

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")
vim.keymap.set('n', "<C-p>", function()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            vim.cmd('cclose')
            return
        end
    end
    vim.cmd('copen')
end, { desc = 'Toggle quickfix list' })

vim.keymap.set("t", "<C-[>", "<C-\\><C-n>")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank({higroup = "CursorLine", timeout = 70})
    end,
})

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        -- import your plugins
        { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- automatically check for plugin updates
    checker = { enabled = true },
})
