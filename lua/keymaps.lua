vim.keymap.set("n", "<leader>w", "<C-w>")
vim.keymap.set("t", "<esc><esc>", "<C-\\><C-n><C-w>")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function(args)
		-- use q key to exit quickfix
		vim.keymap.set("n", "q", function()
			vim.cmd("cclose")
		end, { silent = true, buffer = args.buf })
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		vim.keymap.set("n", "<leader>lj", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, { desc = "Next diagnostic", buffer = args.buf })

		vim.keymap.set("n", "<leader>lk", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, { desc = "Prev diagnostic", buffer = args.buf })

		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Declaration", buffer = args.buf })
		vim.keymap.set("n", "<leader>lI", vim.lsp.buf.incoming_calls, { desc = "Incoming calls", buffer = args.buf })
		vim.keymap.set("n", "<leader>lR", vim.lsp.buf.references, { desc = "References", buffer = args.buf })
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action", buffer = args.buf })
		vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Definition", buffer = args.buf })
		vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation", buffer = args.buf })
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename", buffer = args.buf })
		vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Type definition", buffer = args.buf })
		vim.keymap.set("n", "<leader>lh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { desc = "Toggle inlay hints", buffer = args.buf })
	end,
})
