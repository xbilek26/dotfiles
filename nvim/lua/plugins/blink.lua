return {
    "Saghen/blink.cmp",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "onsails/lspkind.nvim",
    },
    opts = {
        keymap = { preset = "default" },

        appearance = {
            nerd_font_variant = "mono",
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
                    components = {
                        kind_icon = {
                            text = function(item)
                                local kind = require("lspkind").symbol_map[item.kind] or ""
                                return kind .. " "
                            end,
                            highlight = "CmpItemKind",
                        },
                        label = {
                            text = function(item)
                                return item.label
                            end,
                            highlight = "CmpItemAbbr",
                        },
                        kind = {
                            text = function(item)
                                return item.kind
                            end,
                            highlight = "CmpItemKind",
                        },
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
