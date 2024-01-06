local builtin = require('telescope.builtin')
local telescope = require('telescope')

telescope.setup({ -- remove file preview
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = '  ',
        color_devicons = true,
        file_previewer = nil,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        preview_title = false,
    },
})

-- Set custom colors with transparency
vim.cmd([[
hi TelescopeBorder      guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE
hi TelescopePrompt      guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE
hi TelescopeResults     guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE
hi TelescopePreviewBorder guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE
hi TelescopeSelection   guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE
hi TelescopeSelectionCaret guifg=Grey guibg=NONE ctermfg=Grey ctermbg=NONE

" Set transparency for Telescope
hi Normal guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi NormalNC guibg=NONE ctermbg=NONE
hi VertSplit guibg=NONE ctermbg=NONE
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLineNC guibg=NONE ctermbg=NONE
]])

-- Set Telescope transparency
vim.cmd('hi! link TelescopeNormal Normal')
vim.cmd('hi! link TelescopeResultsLine Normal')
vim.cmd('hi! link TelescopePreviewBorder TelescopeNormal')
vim.cmd('hi! link TelescopePromptBorder TelescopeNormal')
vim.cmd('hi! link TelescopeSelection TelescopeNormal')
vim.cmd('hi! link TelescopeSelectionCaret TelescopeNormal')
vim.cmd('hi! link TelescopeMultiSelection TelescopeNormal')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
