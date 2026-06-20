return {
    "nvim-lualine/lualine.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "linrongbin16/lsp-progress.nvim",
    },

    config = function()
        require("lualine").setup({
            options = {
                theme = "kanagawa",
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 } },
                lualine_x = { "encoding", "filetype" },
                lualine_y = { "lsp_status" },
                lualine_z = { "progress" },
            },
        })
    end,
}
