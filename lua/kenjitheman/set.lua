-- Disable the cursor line/column indicator in GUI mode
vim.opt.guicursor = ""

-- Enable line numbers and relative line numbers
vim.opt.number = true
vim.opt.relativenumber = false

-- Set tab-related options
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable smart indent
vim.opt.smartindent = true

-- Disable/enable text wrapping
vim.opt.wrap = true

-- Disable swap, backup, and enable undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Disable search highlighting, enable incremental search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Enable termguicolors for better color support
vim.opt.termguicolors = true

-- Set scrolloff and signcolumn
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- Allow "@" in file names for various operations
vim.opt.isfname:append("@-@")

-- Set the update time interval for CursorHold
vim.opt.updatetime = 50

-- Highlight a column at position 80
vim.opt.colorcolumn = "0"
