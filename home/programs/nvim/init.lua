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
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options


--INCLUDE'S
require("mappings")
require("plugins.nvim-tree")
require("plugins.fzf-lua")
require("plugins.alpha-nvim")
-- require("plugins")


vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = diagnostic_qf_grp,
  callback = function()
    -- Get all current diagnostics across the entire project
    local diagnostics = vim.diagnostic.get()
-- 2. Defer all window layout movements until Neovim is out of the "buffer close" danger zone
    vim.schedule(function()
      -- Check if the current window is still valid before doing anything
      if not vim.api.nvim_win_is_valid(0) then return end
    
    if #diagnostics > 0 then
      -- 1. Silently update the quickfix list content without jumping your cursor
      vim.diagnostic.setqflist({ open = false })
     local current_win = vim.api.nvim_get_current_win() 
      -- 2. Open the quickfix window at the bottom if it isn't already open
      -- (using 'cwindow' ensures it only opens if there are actual Errors/Warnings)
      vim.cmd("cwindow")
      vim.api.nvim_set_current_win(current_win)
    else
      -- 3. Automatically close the quickfix window if all errors are fixed!
      vim.fn.setqflist({})
      end
    end)
  end,
})
