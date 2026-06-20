return {
    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "j-hui/fidget.nvim",
        },

        config = function()
            vim.env._JAVA_OPTIONS =
                "-Djdk.xml.totalEntitySizeLimit=0 -Djdk.xml.entityExpansionLimit=0"

            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls",
                    "clangd",
                    "eslint",
                    "gopls",
                    "html",
                    "ts_ls",
                    "marksman",
                    "rust_analyzer",
                    "lua_ls",
                    "zls",
                    "cssls",
                    "nil_ls",
                },
            })

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })

            -- add the rest of your servers here
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
    },

    {
        "linrongbin16/lsp-progress.nvim",
        event = "VimEnter",

        config = function()
            require("lsp-progress").setup()
        end,
    },
}
