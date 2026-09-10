-- Works best with completeopt=noselect



-- Works best with completeopt=noselect.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
--    vim.cmd[[set completeopt+=menuone,noselect,popup]]
--    vim.lsp.start({
--      name = 'ts_ls',
--      cmd = …,
--      on_attach = function(client, bufnr)
--        vim.lsp.completion.enable(true, client.id, bufnr, {
--          autotrigger = true,
--          convert = function(item)
--            return { abbr = item.label:gsub('%b()', '') }
--          end,
--        })
--      end,
--    })
--
--
--
--
--
-- vim.api.nvim_create_autocmd('LspAttach', {
--	
--      group = vim.api.nvim_create_augroup('my.lsp', {}),
--      callback = function(args)
--        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
--        if client:supports_method('textDocument/implementation') then
--          -- Create a keymap for vim.lsp.buf.implementation ...
--        end
--
--        -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
--        if client:supports_method('textDocument/completion') then
--          -- Optional: trigger autocompletion on EVERY keypress. May be slow!
--          -- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
--          -- client.server_capabilities.completionProvider.triggerCharacters = chars
--
--          vim.lsp.completion.enable(true, client.id, args.buf, {autotrigger = true})
--        end
--
--        -- Auto-format ("lint") on save.
--        -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
--        if not client:supports_method('textDocument/willSaveWaitUntil')
--            and client:supports_method('textDocument/formatting') then
--          vim.api.nvim_create_autocmd('BufWritePre', {
--            group = vim.api.nvim_create_augroup('my.lsp', {clear=false}),
--            buffer = args.buf,
--            callback = function()
--              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
--            end,
--          })
--        end
--      end,
--    })
--PYTHON----------------------------------------------------------------------------
vim.lsp.config['pyright'] = {
	-- Command and arguments to start the server.
	cmd = { 'pyright-langserver', '--stdio' },

	-- Filetypes to automatically attach to.
	filetypes = { 'python' },

	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { '.git' },

	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
	}
}

vim.lsp.enable('pyright')



--LUA--------------------------------------------------------------------------
vim.lsp.config['emmylua_ls'] = {

	-- Command and arguments to start the server.

	cmd = { 'emmylua_ls' },

	-- Filetypes to automatically attach to.

	filetypes = { 'lua' },

	-- Sets the workspace "root" to the directory where any of these files is found.

	-- Files sharing a root will reuse the LSP client/connection.

	-- Nested lists indicate equal priority, see |vim.lsp.Config|.

	root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },

	-- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md

	settings = {

		runtime = {

			version = 'LuaJIT',

		}

	}

}
vim.lsp.enable('emmylua_ls')


--AUTOCOMPLETE----------------------------------------------------------------------------------
--vim.o.autocomplete = true gives an error
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'popup' }
vim.api.nvim_create_autocmd('LspAttach', {

	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- Create a keymap for vim.lsp.buf.implementation ...
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
-- Use CTRL-space to trigger LSP completion.
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.keymap.set('i', '<c-space>', function()
  vim.lsp.completion.get()
end)
