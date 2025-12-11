return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {
			root_markers = { ".git", ".jj" },
		})

		vim.lsp.enable({
			"lua_ls",
			"nixd",
			"clangd",
			"gopls",
			"zls",
			"cssls",
			"vtsls",
			"roslyn_ls",
			"gleam",
			"basedpyright",
		})
	end,
}
