return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            styles = {
                functions = { italic = false },
                comments = { italic = false },
                keywords = { italic = false },
                variables = { italic = false },
            },
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
