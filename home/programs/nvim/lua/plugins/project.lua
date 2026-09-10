
require("project").setup({
    -- Тут мы паказваем плагіну выкарыстоўваць менавіта fzf-lua для адлюстравання
    datapath = vim.fn.stdpath("data"),
    show_hidden = false,

})
    local ok, fzf = pcall(require, "fzf-lua")
    if ok then
      fzf.register_ui_select()
    end
