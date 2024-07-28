vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("<Plug>(LSPDefinition)", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("<Plug>(LSPReferences)", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("<Plug>(LSPImplementations)", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("<Plug>(LSPDeclaration)", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("<Plug>(LSPTypeDefinitions)", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
		map("<Plug>(LSPDocumentSymbols)", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
		map("<Plug>(LSPRename)", vim.lsp.buf.rename, "[R]e[n]ame")
		map("<Plug>(LSPCodeAction)", vim.lsp.buf.code_action, "[C]ode [A]ction")
		map(
			"<Plug>(LSPWorkspaceSymbols)",
			require("telescope.builtin").lsp_dynamic_workspace_symbols,
			"[W]orkspace [S]ymbols"
		)

		local signs = { Error = "", Warn = "", Hint = "󰋗", Info = "" }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	bashls = {},
	clangd = {},
	-- gopls = {},
	-- pyright = {},
	-- rust_analyzer = {},
	-- See `:help lspconfig-all` for a list of all the pre-configured LSPs

	-- Some languages (like typescript) have entire language plugins that can be useful:
	--    https://github.com/pmizio/typescript-tools.nvim

	-- But for many setups, the LSP (`tsserver`) will work just fine
	tsserver = {},

	-- tailwindcss = {},
	-- intelephense = {},

	html = {},
	emmet_language_server = {},
	jsonls = {},
	eslint = {},
	marksman = {},
	cssls = {
		init_options = {
			provideFormatter = false,
		},
		-- settings = {
		-- 	css = {
		-- 		lint = {
		-- 			unknownAtRules = "ignore",
		-- 		},
		-- 	},
		-- },
	},
	lua_ls = {
		-- cmd = {...},
		filetypes = { "lua" },
		-- capabilities = {},
		settings = {
			Lua = {
				runtime = { version = "LuaJIT" },
				workspace = {
					checkThirdParty = false,
					-- Tells lua_ls where to find all the Lua files that you have loaded
					-- for your neovim configuration.
					-- library = {
					-- 	"${3rd}/luv/library",
					-- 	unpack(vim.api.nvim_get_runtime_file("", true)),
					-- },
					-- If lua_ls is really slow on your computer, you can try this instead:
					library = { vim.env.VIMRUNTIME },
				},
				completion = {
					callSnippet = "Replace",
				},
				-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- diagnostics = { disable = { 'missing-fields' } },
			},
		},
	},
}

require("mason").setup()

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"prettier",
	"prettierd",
	"shfmt",
	"shellcheck",
	"eslint",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			-- This handles overriding only values explicitly passed
			-- by the server configuration above. Useful when disabling
			-- certain features of an LSP (for example, turning off formatting for tsserver)
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
