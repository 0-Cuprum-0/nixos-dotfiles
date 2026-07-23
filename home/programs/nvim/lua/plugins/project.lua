return {
  'DrKJeff16/project.nvim',
  dependencies = {
    'ibhagwan/fzf-lua', -- пакідаем толькі fzf-lua
  },
  opts = {
    -- Тут мы паказваем плагіну выкарыстоўваць менавіта fzf-lua для адлюстравання
    datapath = vim.fn.stdpath("data"),
    show_hidden = false,
  },
  config = function(_, opts)
    require("project").setup(opts)
    local ok, fzf = pcall(require, "fzf-lua")
    if ok then
      fzf.register_ui_select()
    end
  end,
}
