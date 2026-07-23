return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    require("nvim-tree").setup({
      view = {
        width = 50,
      },
      git = {
   	 enable = true,
   	 ignore = false,
	 timeout = 400,
  },
    })
  end,
}
