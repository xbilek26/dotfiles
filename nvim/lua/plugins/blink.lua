return {
    "Saghen/blink.cmp",
    event = "InsertEnter",
    config = function()
        require("blink.cmp").setup({
            keymap = { preset = "default" },

            appearance = {
                nerd_font_variant = "mono",
            },

            completion = {
                documentation = { auto_show = false },
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = {
                implementation = "lua",
            },
        })
    end,
}
