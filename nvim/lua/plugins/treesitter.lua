return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require("nvim-treesitter").install { "c", "cpp", "java" }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp", "java" },
            callback = function() vim.treesitter.start() end,
        })
    end,
}
