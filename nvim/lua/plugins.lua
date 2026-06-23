vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    transparent = true,
    bold = false,
    italic = false,
    on_highlights = function(hl, colors)
        hl.ModeMsg = { fg = colors.fg }
        hl.StatusLine = { bg = colors.line }
        hl.NetrwMarkFile = { bold = true }
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

------------------------------------------------------------

vim.pack.add({
    "https://github.com/rhart92/codex.nvim"
})

vim.schedule(function()
    require("codex").setup({
        split = "float",
        float = {
            width = 0.8,
            height = 0.8,
            title = "Codex",
        },
    })
end)

vim.keymap.set("n", "<leader>c", function() require("codex").toggle() end)
vim.keymap.set("t", "<C-w><C-q>", function() require("codex").toggle() end)
vim.keymap.set("v", "<leader>s", function() require("codex").actions.send_selection() end)
