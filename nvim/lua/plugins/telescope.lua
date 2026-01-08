return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Show Buffers" },
    },
    opts = {
        pickers = {
            live_grep = {
                file_ignore_patterns = { ".git", ".venv" },
                additional_args = function(_)
                    return { "--hidden" }
                end,
            },
            find_files = {
                hidden = true,
            },
        },
    },
}
