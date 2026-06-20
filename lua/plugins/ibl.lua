return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    config = function()
        local api = vim.api

        local exclude_ft = {
            "help",
            "git",
            "markdown",
            "snippets",
            "text",
            "gitconfig",
            "alpha",
            "dashboard",
        }

        require("ibl").setup({
            indent = {
                char = "▏",
            },

            scope = {
                show_start = false,
                show_end = false,
            },

            exclude = {
                filetypes = exclude_ft,
                buftypes = { "terminal" },
            },
        })

        local gid =
            api.nvim_create_augroup("indent_blankline", { clear = true })

        api.nvim_create_autocmd("InsertEnter", {
            group = gid,
            command = "IBLDisable",
        })

        api.nvim_create_autocmd("InsertLeave", {
            group = gid,
            callback = function()
                if not vim.tbl_contains(exclude_ft, vim.bo.filetype) then
                    vim.cmd("IBLEnable")
                end
            end,
        })
    end,
}
