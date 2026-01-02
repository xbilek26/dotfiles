return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true })
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { silent = true })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "c", "cpp" },
            callback = function()
                vim.lsp.start({
                    cmd = { "clangd" },
                    filetypes = { "c", "cpp" },
                    root_markers = { "compile_commands.json", ".git" },
                })
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java" },
            callback = function()
                vim.lsp.start({
                    cmd = { "jdtls" },
                    filetypes = { "java" },
                    root_markers = { "gradlew", "mvnw", ".git" },
                })
            end,
        })

        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
        })

    end,
}
