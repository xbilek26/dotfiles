-- Colorcheme
vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    italic = false,
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

-- LSP
vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.enable({
    "lua_ls", "clangd", "jdtls"
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })


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

-- Moving cursor
vim.pack.add({
    "https://github.com/sphamba/smear-cursor.nvim",
})

require("smear_cursor").setup({
    opts = {
        time_interval = 7,
    },
})

-- Parser
vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter").install { "c", "cpp", "java", "lua" }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp", "java", "lua" },
            callback = function() vim.treesitter.start() end,
        })
    end,
})
