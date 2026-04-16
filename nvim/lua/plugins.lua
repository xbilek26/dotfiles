-- Colorscheme
vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    lazy = false,
    priority = 1000,
    bold = false,
    italic = false,
    colors = {
        bg = "#000000",
    }
})
vim.cmd("colorscheme vague")

-- Package manager
vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({
    cmd = "Mason",
})

-- LSP
vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.enable({
    "clangd",
    "rust_analyzer",
    "jdtls",
    "lua_ls",
    "ts_ls",
    "basedpyright",
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
    update_in_insert = false,
})

vim.diagnostic.status = function() return "" end
