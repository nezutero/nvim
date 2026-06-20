return {
    "folke/zen-mode.nvim",
    config = function()
        require("zen-mode").setup({
            window = {
                backdrop = 1,
                width = 90,
                height = 1,
                padding = {
                    left = 0,
                    right = 0,
                },
                options = {
                    number = false,
                    relativenumber = false,
                    signcolumn = "no",
                    foldcolumn = "0",
                    list = false,
                },
            },
            plugins = {
                twilight = { enabled = false },
                gitsigns = { enabled = false },
                tmux = { enabled = false },
                kitty = { enabled = false },
                alacritty = {
                    enabled = true,
                    font = "16",
                },
            },
            on_open = function()
                vim.api.nvim_set_hl(0, "ZenBg", { bg = "NONE" })
            end,
        })
    end,
}
