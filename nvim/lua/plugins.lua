vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    transparent = true,
    bold = false,
    italic = false,
    on_highlights = function(hl, colors)
        hl.ModeMsg = {}
        hl.StatusLine = { bg = colors.line  }
        hl.netrwMarkFile = { bold = true }
    end,
})

vim.cmd("colorscheme vague")

------------------------------------------------------------

vim.pack.add({
    "https://github.com/tpope/vim-fugitive",
})

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

--------------------------------------------------------------

vim.pack.add({
    "https://github.com/johnseth97/codex.nvim"
})

vim.keymap.set("n", " c", vim.cmd.Codex)
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local ft = vim.bo.filetype
        if ft == "codex" then
            vim.wo.winblend = 0
        end
    end,
})
