return {
    "MeanderingProgrammer/render-markdown.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
        require("render-markdown").setup({})
    end,
}
