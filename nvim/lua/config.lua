vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guicursor = ""
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.numberwidth = 2
vim.opt.termguicolors = true
vim.opt.wildignore:append("*/node_modules/*")
vim.g.netrw_list_hide = [[^\.[^./]\+]]

vim.keymap.set("n", "<space>e", vim.cmd.Ex)

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 35 })
    end,
})

vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.wo.cursorline = false
  end,
})
