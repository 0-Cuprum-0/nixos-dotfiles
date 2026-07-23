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
--MAPPINGS
local map = vim.keymap.set
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
map("n", "<leader>y", ":Yazi<CR>")

--Moving on tabs
map("n", "<leader>1", ":tabn 1<CR>") 
map("n", "<leader>2", ":tabn 2<CR>")
map("n", "<leader>3", ":tabn 3<CR>")


--live_grep
map('n', '<leader>lg', ':FzfLua live_grep<CR>', { desc = 'Live grep in the project'})


--close buffer
map("n", "<leader>c", ":bp | bd #<CR>")
--move between buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bp<CR>")
--projects managment
map('n', '<leader>pr', ':Project recents<CR>', { desc = 'Print Recent Projects'})
  --enable line numbers
  vim.o.number = true
  vim.o.relativenumber = true
  --add keyboard
vim.opt.clipboard = "unnamedplus"
  require("config.lazy")

  --enable\ define terminal
  vim.opt.shell = "bash"
  --Create 3 tabs on startup
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("tabnew") 

    vim.cmd("tabnew") 
    vim.cmd("tabnext 1") 
    end,
})
-- Jump to the NEXT error/warning
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- Jump to the PREVIOUS error/warning
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })

-- See the full error message in a floating window
    vim.keymap.set('n', '<leader>[', vim.diagnostic.open_float, { desc = 'Floating Diagnostic' })
 -- Create an autocommand group for diagnostic quickfix automation
local diagnostic_qf_grp = vim.api.nvim_create_augroup("DiagnosticToQf", { clear = true })

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
