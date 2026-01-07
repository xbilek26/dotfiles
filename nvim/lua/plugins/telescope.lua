return {
    "nvim-telescope/telescope.nvim",
    keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>pc", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
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
