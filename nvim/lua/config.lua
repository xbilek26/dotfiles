vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.wildignore:append({"*/node_modules/*", "*/assets/*"})
vim.g.netrw_list_hide = [[^\.[^./]\+]]
vim.g.loaded_matchparen = true

vim.api.nvim_create_autocmd({ "WinEnter", "BufWinEnter", "FileType" }, {
    callback = function()
        vim.wo.cursorline = true
        vim.wo.cursorlineopt = vim.bo.filetype == "netrw" and "both" or "number"
    end,
})

vim.api.nvim_create_autocmd("WinLeave", {
    callback = function()
        vim.wo.cursorline = false
        vim.wo.cursorlineopt = "number"
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 35 })
    end,
})
