return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {
			root_markers = { ".git", ".jj" },
		})

		vim.lsp.config("elixirls", { cmd = "elixir-ls" })

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("nil_ls")
		vim.lsp.enable("nixd")
		vim.lsp.enable("clangd")
		vim.lsp.enable("elixirls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("zls")
		vim.lsp.enable("cssls")
		vim.lsp.enable("vtsls")
	end,
}
