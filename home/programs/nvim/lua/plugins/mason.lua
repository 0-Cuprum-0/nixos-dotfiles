return {
  -- 1. Ставім сам Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" } -- прыгожыя рамкі ў меню
      })
    end
  },

  -- 2. Ставім мост паміж Mason і кампілятарамі моў
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Аўтаматычна спампоўваем Java (jdtls) і LaTeX (texlab)
        ensure_installed = { "jdtls", "texlab" },
      })
    end
  }
}
