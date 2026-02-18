require("config.lazy")
require("config.lsp")
require("config.dap")
require("config.filetype")

vim.o.termguicolors = true
require("tokyonight").setup({
    transparent = true,           -- This enables transparency
    styles = {
        sidebars = "transparent", -- Optional: makes floating windows/sidebars transparent too
        floats = "transparent",
    },
})
vim.cmd [[colorscheme tokyonight-night]]

vim.opt.inccommand = "split" -- or "nosplit"
vim.opt.tabstop = 4
vim.opt.colorcolumn = "80"
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.o.number = true
vim.o.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.o.showmode = false
vim.o.breakindent = true
vim.o.undofile = true
vim.o.scrolloff = 8
vim.o.confirm = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>')
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
