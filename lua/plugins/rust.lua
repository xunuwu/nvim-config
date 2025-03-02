local function create_keymaps(_client, bufnr)
	vim.keymap.set("n", "<leader>la", function()
		vim.cmd.RustLsp("codeAction")
	end, { buffer = bufnr, silent = true, desc = "Code action" })

	vim.keymap.set("n", "<leader>pd", function()
		vim.cmd.RustLsp("renderDiagnostic")
	end, { buffer = bufnr, silent = true, desc = "Render diagnostic" })

	vim.keymap.set("n", "<leader>pD", function()
		vim.cmd.RustLsp("openDocs")
	end, { buffer = bufnr, silent = true, desc = "Docs" })

	vim.keymap.set("n", "<leader>pe", function()
		vim.cmd.RustLsp("explainError")
	end, { buffer = bufnr, silent = true, desc = "Explain error" })

	vim.keymap.set("n", "<leader>pr", function()
		vim.cmd.RustLsp({ "runnables", bang = true })
	end, { buffer = bufnr, silent = true, desc = "Run last" })

	vim.keymap.set("n", "<leader>pR", function()
		vim.cmd.RustLsp("runnables")
	end, { buffer = bufnr, silent = true, desc = "Run" })

	vim.keymap.set("n", "<leader>pm", function()
		vim.cmd.RustLsp("expandMacro")
	end, { buffer = bufnr, silent = true, desc = "Expand macro" })
end

return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			-- Plugin configuration
			tools = {},
			-- LSP configuration
			server = {
				on_attach = create_keymaps,
				default_settings = {
					-- rust-analyzer language server configuration
					["rust-analyzer"] = {},
				},
			},
			-- DAP configuration
			dap = {},
		}
	end,
}
