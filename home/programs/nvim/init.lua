 --remap the <leader>
vim.g.mapleader = " "
  -- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

--enable luatab
vim.opt.showtabline = 2
  --keymaps
vim.opt.scrolloff = 10  
vim.opt.colorcolumn = "100"
vim.opt.undofile = true
--vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.laststatus = 2

   --enable line numbers
vim.o.number = true
vim.o.relativenumber = true
--add keyboard
vim.opt.clipboard = "unnamedplus"
--  require("config.lazy")
--  disable mouse
--vim.opt.mouse = ""
--enable\ define terminal
vim.opt.shell = "bash"

--INCLUDE'S
require("mappings")
require("plugins.nvim-tree")
require("plugins.fzf-lua")
require("plugins.alpha-nvim")
require("plugins.oxocarbon")
require("lsp")
require("plugins.nvim-autopairs")
require("plugins.lualine")
require("plugins.project")



