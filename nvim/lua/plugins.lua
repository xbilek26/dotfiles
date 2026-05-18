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
    colors = {
        string = "#e6b68d",
        number = "#e1a56a",
    },
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
    "ts_ls",
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

------------------------------------------------------------

vim.pack.add({
    "https://github.com/monkoose/neocodeium",
})

neocodeium = require("neocodeium")

neocodeium.setup({
    manual = true,
    show_label = false,
    silent = true,
})

vim.keymap.set("i", "<C-u>", neocodeium.cycle_or_complete)
vim.keymap.set("i", "<C-y>", neocodeium.accept)

------------------------------------------------------------

vim.pack.add({
    "https://github.com/github/copilot.vim",
})

vim.g.copilot_enabled = false
