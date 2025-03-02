return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { { "saghen/blink.cmp", version = "*" } },
	opts = {
		servers = {
			lua_ls = { settings = { Lua = { telemetry = { enable = false } } } },
			nil_ls = {},
			nixd = {},
			clangd = {},
			elixirls = { cmd = "elixir-ls" },
			ts_ls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescriptreact.tsx",
				},
			},
		},
	},
	config = function(_, opts)
		for name, config in pairs(opts.servers) do
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			require("lspconfig")[name].setup(config)
		end
	end,
}
