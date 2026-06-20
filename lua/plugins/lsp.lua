return {
    {
        "williamboman/mason.nvim",
        config = true,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
        },
    },

    {
        "j-hui/fidget.nvim",
        opts = {},
    },

    {
        "linrongbin16/lsp-progress.nvim",
        event = "VimEnter",

        config = function()
            require("lsp-progress").setup()
        end,
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

            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

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

            local servers = {
                bashls = {},
                clangd = {},
                eslint = {},
                gopls = {},
                html = {},
                ts_ls = {},
                marksman = {},
                rust_analyzer = {},
                zls = {},
                cssls = {},
                nil_ls = {},

                lua_ls = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
            }

            for server, opts in pairs(servers) do
                opts.capabilities = capabilities

                vim.lsp.config(server, opts)
                vim.lsp.enable(server)
            end
        end,
    },
}
