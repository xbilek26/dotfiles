vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    bold = false,
    italic = false,
    on_highlights = function(hl, colors)
        hl.ModeMsg = { fg = colors.fg }
        hl.StatusLine = { bg = colors.line }
        hl.NetrwMarkFile = { bold = true }
        hl.Pmenu = { bg = nil }
        hl.Directory = { fg = "#8ba9c1" }
    end,
})

vim.cmd.colorscheme("vague")

------------------------------------------------------------

vim.pack.add({
    "https://github.com/tpope/vim-fugitive",
})

vim.keymap.set("n", "<leader>g", vim.cmd.Git)

------------------------------------------------------------

vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})


vim.api.nvim_create_autocmd("FileType", {
    pattern = { "java" },
    callback = function() vim.treesitter.start() end,
})

------------------------------------------------------------

vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({
    cmd = "Mason",
})

------------------------------------------------------------

vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig"
})

vim.lsp.enable({
    "clangd",
    "basedpyright",
})

vim.diagnostic.config({
    virtual_text = false,
    signs = false,
    underline = false,
    update_in_insert = false,
})

vim.diagnostic.status = function() return "" end
