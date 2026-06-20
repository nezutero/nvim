return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "vimdoc",
                "javascript",
                "typescript",
                "c",
                "lua",
                "rust",
                "go",
                "tsx",
                "cpp",
                "bash",
                "dockerfile",
                "elixir",
                "gitignore",
                "gomod",
                "gosum",
                "gowork",
                "html",
                "css",
                "json",
                "python",
                "yaml",
                "markdown",
                "sql",
                "toml",
            },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
