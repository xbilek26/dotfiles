return {
    "Bhanukamax/tman.nvim",
    config = function()
        local tman = require('tman')
        tman.setup {
            split = "bottom", -- "bottom", "right"
            width = 50,
            height = 40,
        }
        vim.keymap.set("n", "<C-t>", function () tman.toggleLast({insert = true}) end)
        vim.keymap.set("t", "<C-t>", tman.toggleLast)
    end,
}
