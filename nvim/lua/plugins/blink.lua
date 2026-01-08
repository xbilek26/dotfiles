return {
    "Saghen/blink.cmp",
    opts = {
        appearance = {
            nerd_font_variant = "mono",
        },

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
    },
}
