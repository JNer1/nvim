-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.fillchars:append("eob: ")
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.cmd([[
augroup ts_settings
  autocmd!
  autocmd FileType typescript,javascript,typescriptreact,javascriptreact,html,css,prisma,astro setlocal tabstop=2 shiftwidth=2
augroup END
]])

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

vim.opt.list = true

-- skip backwards compatibility routines and speed up loading
vim.g.skip_ts_context_commentstring_module = true
