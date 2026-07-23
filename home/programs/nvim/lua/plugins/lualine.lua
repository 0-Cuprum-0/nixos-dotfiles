return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'auto', 
      globalstatus = true,
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        'branch',
        'diff',
        'diagnostics',
        {
          "project",
          format = 'name',
          no_project = 'N/A',
          separator = " ",
          enclose_pair = nil,
        }
      },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    },
  },
}
