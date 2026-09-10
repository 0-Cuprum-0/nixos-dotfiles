local fzf = require('fzf-lua')
local map = vim.keymap.set

-- 1. Setup options
fzf.setup({
    fzf_colors = true,
    fzf_opts = {
        ['--no-scrollbar'] = false,
        ['--cycle'] = true,
        ['--ansi'] = true,
        ['--height'] = '100%',
        ['--highlight-line'] = true,
    },
    defaults = {
        formatter = 'path.dirname_first',
    },
    winopts = {
        height = 0.90,
        width = 0.80,
        preview = {
            layout = 'vertical',
        },
    },
    keymap = {
        fzf = {
            ['ctrl-k'] = 'up',
            ['ctrl-j'] = 'down',
            ['ctrl-b'] = 'preview-page-up',
            ['ctrl-f'] = 'preview-page-down',
            ['ctrl-u'] = 'half-page-up',
            ['ctrl-d'] = 'half-page-down',
            ['ctrl-c'] = 'abort',
	    ["ctrl-q"] = "select-all+accept",
        },
    },
})

-- 2. Convert Lazy 'keys' table into native Neovim keymaps

-- Leader Leader shortcuts
map('n', '<leader><leader>h', function() fzf.files({ cwd = vim.fn.expand('$HOME') }) end, { desc = 'Find files globally (Home)' })
map('n', '<leader><leader>n', function() fzf.files({ cwd = vim.fn.expand('/etc/nixos/') }) end, { desc = 'Go to nixos conf' })
map('n', '<leader><leader>', '<cmd>FzfLua files<cr>', { desc = 'Find files in project directory' })

-- Go to definition
map('n', 'gd', function() fzf.lsp_definitions({ jump1 = true }) end, { desc = 'Go to definition' })
map('n', 'gD', function() fzf.lsp_definitions({ jump1 = false }) end, { desc = 'Find definitions' })

-- Grep & Finders
map('n', '<leader>/', '<cmd>FzfLua live_grep<cr>', { desc = 'Find by grepping in project directory' })
map('n', '<leader>fg', '<cmd>FzfLua grep<cr>', { desc = 'Fuzzy find by using ripgrep in project directory' })
map('n', '<leader>fc', '<cmd>FzfLua lgrep_curbuf<cr>', { desc = 'Find (grep) in current buffer' })
map('x', '<leader>fv', '<cmd>FzfLua grep_visual<cr>', { desc = 'Find (grep) visual selection in project' })
map('n', '<leader>fw', '<cmd>FzfLua grep_cword<cr>', { desc = 'Find current word' })
map('n', '<leader>fW', '<cmd>FzfLua grep_cWORD<cr>', { desc = 'Find current WORD' })
map('n', '<leader>fr', '<cmd>FzfLua resume<cr>', { desc = 'Find in resumed search' })
map('n', '<leader>fb', '<cmd>FzfLua buffers<cr>', { desc = 'Find open buffers' })
map('n', '<leader>fd', '<cmd>FzfLua diagnostics_document<cr>', { desc = 'Find diagnostics' })
map('n', '<leader>fo', '<cmd>FzfLua oldfiles<cr>', { desc = 'Find old files' })
map('n', '<leader>fa', '<cmd>FzfLua autocmds<cr>', { desc = 'Find autocommands' })
map('n', '<leader>fO', '<cmd>FzfLua nvim_options<cr>', { desc = 'Find Neovim options' })
map('n', '<leader>vh', '<cmd>FzfLua helptags<cr>', { desc = 'View/search Neovim help' })

-- Git Integration
map('n', '<leader>gsa', '<cmd>FzfLua git_status<cr>', { desc = 'Find git status' })
map('n', '<leader>gd', '<cmd>FzfLua git_diff<cr>', { desc = 'Find git diff' })
map('n', '<leader>gc', '<cmd>FzfLua git_commits<cr>', { desc = 'Find git commits' })
map('n', '<leader>gC', '<cmd>FzfLua git_bcommits<cr>', { desc = 'Find git commits in current file' })
map('n', '<leader>gbl', '<cmd>FzfLua git_blame<cr>', { desc = 'Find git blame' })
map('n', '<leader>gbr', '<cmd>FzfLua git_branches<cr>', { desc = 'Find git branches' })

-- Custom Functions
map('n', '<leader>cn', function() fzf.files({ cwd = vim.fn.stdpath('config') }) end, { desc = 'Find in neovim configuration' })
map('i', '<C-x><C-f>', function()
    fzf.complete_path({
        winopts = {
            height = 0.4,
            width = 0.5,
            relative = 'cursor',
        },
    })
end, { desc = 'Fuzzy complete path' })
