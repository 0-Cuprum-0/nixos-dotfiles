
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
--  require("config.lazy")

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
--DIAGNOSTIC Jump to the NEXT error/warning
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostic' })

-- Jump to the PREVIOUS error/warning
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostic' })

-- See the full error message in a floating window
    vim.keymap.set('n', '<leader>[', vim.diagnostic.open_float, { desc = 'Floating Diagnostic' })
 -- Create an autocommand group for diagnostic quickfix automation
local diagnostic_qf_grp = vim.api.nvim_create_augroup("DiagnosticToQf", { clear = true })
-- QUICKFIX
vim.keymap.set('n', '<leader>qd', vim.diagnostic.setqflist, {desc = 'Open diagnostics in qf'})
