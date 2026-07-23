vim.api.nvim_create_buf(true,false )




vim.api.nvim_open_win(0, true,
          {relative='mouse',row = 3, col=3, width=50, height=25   })
local noted_file = "~/todo.md"
vim.cmd(":edit" .. vim.fn.fnameescape(noted_file))
	  
--check if opened with 
-- |nvim_win_close()|

	
