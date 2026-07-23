return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      
      -- Java
      lspconfig.jdtls.setup({})
      
      -- LaTeX
      lspconfig.texlab.setup({})

      -- hotkeys:
      local map = vim.keymap.set
      map('n', 'gd', vim.lsp.buf.definition, { desc = 'Перайсці да вызначэння' })
      map('n', 'K', vim.lsp.buf.hover, { desc = 'Дакументацыя (Hover)' })
      map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Папярэдняя памылка' })
      map('n', ']d', vim.diagnostic.goto_next, { desc = 'Наступная памылка' })
      map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Выправіць код (Code Actions)' })
    end
  }
}
