return {
  {
    'Saghen/blink.cmp',
    lazy = false, -- Запускаем адразу, каб працаваў заўсёды
    dependencies = 'rafamadriz/friendly-snippets', -- Шаблоны коду (for-loops, sout і г.д.)
    version = 'v0.*',

    opts = {
      -- Налада клавіш (ідэнтычна VS Code)
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'accept', 'fallback' }, -- Enter пацвярджае выбар падказкі
        ['<Tab>'] = { 'select_next', 'fallback' }, -- Tab рухае ўніз па спісе падказак
        ['<S-Tab>'] = { 'select_prev', 'fallback' }, -- Shift+Tab рухае ўгору
      },

      -- Адкуль збіраць словы для падказак:
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- Эстэтыка (круглае вакенца падказак)
      completion = {
        menu = { border = 'rounded' },
        documentation = { auto_show = true, window = { border = 'rounded' } },
      },
    },
  },
}
