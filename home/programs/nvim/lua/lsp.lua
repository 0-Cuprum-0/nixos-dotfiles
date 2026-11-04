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




--NIX--------------------------------------------------------------------------
vim.lsp.config['nil'] = {
	-- Command and arguments to start the server.
	cmd = { 'nil' },

	-- Filetypes to automatically attach to.
	filetypes = { 'nix' },

	-- Sets the "root directory" to the parent directory of the file in the
	-- current buffer that contains either a ".luarc.json" or a
	-- ".luarc.jsonc" file. Files that share a root directory will reuse
	-- the connection to the same LSP server.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { 'flake.nix' },

	-- Specific settings to send to the server. The schema for this is
	-- defined by the server. For example the schema for lua-language-server
	-- can be found here https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
	settings = {
	}
}

vim.lsp.enable('nil')


--JAVA-------------------------------------------------------------------------
vim.lsp.config['java'] = {

	-- Command and arguments to start the server.
	cmd = { 'jdtls' },

	-- Filetypes to automatically attach to.
	filetypes = { 'java' },

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

vim.lsp.enable('java')

--KOTLIN----------------------------------------------------------------------------
vim.lsp.config['kotlin'] = {
	-- Command and arguments to start the server.
	cmd = { 'kotlin-language-server' },

	-- Filetypes to automatically attach to.
	filetypes = { 'kotlin'},

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

vim.lsp.enable('kotlin')





--AUTOCOMPLETE----------------------------------------------------------------------------------
--vim.o.autocomplete = true gives an error
vim.opt.completeopt = { 'menu', 'menuone', 'popup' }
vim.api.nvim_create_autocmd('LspAttach', {

	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		-- Create a keymap for vim.lsp.buf.implementation ...
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

