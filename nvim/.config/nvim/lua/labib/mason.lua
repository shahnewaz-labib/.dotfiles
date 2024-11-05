require("mason").setup()
require("mason-lspconfig").setup()

local servers = {
	clangd = {
		filetypes = { "c", "cpp" },
		settings = {
			tabwidth = 4,
		},
	},
	rust_analyzer = {},
	ts_ls = {},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = {
				disable = { "missing-fields" },
				globals = { "vim" },
			},
		},
	},
}

-- Setup neovim lua configuration

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
	ensure_installed = vim.tbl_keys(servers),
})

local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

	nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
	nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
	nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
	nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
	nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
	nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
	nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
	nmap("<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, "[W]orkspace [L]ist Folders")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		})
	end,
})

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

require("lspconfig").ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

-- Function to stop the clangd server and unmap its keybindings
local function stop_clangd()
	local clients = vim.lsp.get_active_clients()
	for _, client in ipairs(clients) do
		if client.name == "clangd" then
			client.stop()
		end
	end

	-- Optionally unmap clangd-specific keybindings
	local bufnr = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>rn") -- Rename
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ca") -- Code Action
	vim.api.nvim_buf_del_keymap(bufnr, "n", "gd") -- Go to Definition
	vim.api.nvim_buf_del_keymap(bufnr, "n", "gr") -- Go to References
	vim.api.nvim_buf_del_keymap(bufnr, "n", "gI") -- Go to Implementation
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>D") -- Type Definition
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ds") -- Document Symbols
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>ws") -- Workspace Symbols
	vim.api.nvim_buf_del_keymap(bufnr, "n", "K") -- Hover Documentation
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<C-k>") -- Signature Documentation
	vim.api.nvim_buf_del_keymap(bufnr, "n", "gD") -- Go to Declaration
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>wa") -- Add Workspace Folder
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>wr") -- Remove Workspace Folder
	vim.api.nvim_buf_del_keymap(bufnr, "n", "<leader>wl") -- List Workspace Folders
end

-- Create a user command to disable clangd
vim.api.nvim_create_user_command("DisableClangd", stop_clangd, { nargs = 0 })

-- Now you can use the command :DisableClangd to stop clangd
