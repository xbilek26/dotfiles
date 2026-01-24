-- Colorcheme
vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    lazy = false,
    priority = 1000,
    bold = false,
    italic = false,
    colors = {
        bg = "#111111",
    }
})
vim.cmd("colorscheme vague")

-- Autocomplete
vim.pack.add({
    "https://github.com/Saghen/blink.cmp",
})

require("blink.cmp").setup({
    completion = {
        documentation = {
            auto_show = true,
            treesitter_highlighting = true,
        },
        menu = {
            draw = {
                columns = {
                    { "kind_icon", "label", gap = 1 },
                    { "kind" },
                },
            },
        },
    },

    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = {
        implementation = "lua",
    },
})

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
    "lua_ls", "clangd", "jdtls", "tinymist"
})

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = false,
    update_in_insert = false,
})

-- Lualine
vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
})

-- Parser
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
    build = ":TSUpdate",
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "html",
        "css",
        "matlab",
        "javascript",
        "lua",
        "vim",
        "vimdoc",
        "query"
    },
})

-- Typst nvim plugin
vim.pack.add({
    "https://github.com/chomosuke/typst-preview.nvim",
})

require("typst-preview").setup({
    lazy = false,
    version = '1.*',
    opts = {},
})
