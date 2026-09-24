vim.pack.add({
    "https://github.com/vague-theme/vague.nvim",
})

require("vague").setup({
    bold = false,
    italic = false,
    on_highlights = function(hl, colors)
        hl.ModeMsg = { fg = colors.fg }
        hl.NetrwMarkFile = { bold = true }
        hl.Directory = { fg = colors.keyword }
    end,
})

vim.cmd.colorscheme("vague")

------------------------------------------------------------

vim.pack.add({
    "https://github.com/tpope/vim-fugitive",
})

vim.keymap.set("n", "<leader>gg", vim.cmd.Git)

------------------------------------------------------------

vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").install({
    "java",
    "python",
    "cpp",
    "javascript",
    "typescript",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "java",
        "python",
        "c",
        "cpp",
        "javascript",
        "typescript",
    },
    callback = function(args)
        pcall(vim.treesitter.start, args.buf)
    end,
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
    "basedpyright",
    "clangd",
    "jdtls",
    "ts_ls"
})

vim.diagnostic.config({
    virtual_text = false,
    underline = false,
    signs = false,
    update_in_insert = false,
})

vim.diagnostic.status = function() return "" end

------------------------------------------------------------

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
