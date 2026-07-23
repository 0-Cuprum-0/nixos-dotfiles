return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_compiler_method = 'latexmk'
    
    -- ГЭТЫ БЛОК ПРЫМУСІЦЬ LATEXMK ЗАЎСЁДЫ ЗБІРАЦЬ ПРАЗ LUALATEX АЎТАМАТАМ
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-lualatex', -- выкарыстоўваем lualatex па змаўчанні для ўсіх файлаў
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }

    -- Твае налады Zathura
    vim.g.vimtex_view_method = 'general'
    vim.g.vimtex_view_general_viewer = 'zathura'
    vim.g.vimtex_view_automatic = 1
  end
}
