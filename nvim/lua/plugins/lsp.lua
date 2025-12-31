return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })

        vim.lsp.config["clangd"] = {
            cmd = { "clangd" },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
        }

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })

        vim.api.nvim_create_autocmd(
            "FileType",
            {
                pattern = {"c", "cpp"},
                callback = function()
                    vim.lsp.start(vim.lsp.config["clangd"])
                end
            }
        )

    end,
}
