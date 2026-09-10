    require("nvim-tree").setup({
	sync_root_with_cwd = true,

	respect_buf_cwd = true,
  
	update_focused_file = {
	enable = true,
	
  },
      view = {
        width = 50,
      },
      git = {
   	 enable = true,
   	 ignore = false,
	 timeout = 400,
	  	},


    })
