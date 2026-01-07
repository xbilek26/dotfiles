return {
    "Saghen/blink.cmp",
    opts = {
        appearance = {
            nerd_font_variant = "mono",
            kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            },
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },
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
