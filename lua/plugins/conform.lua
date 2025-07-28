vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		-- FormatDisable! will disable formatting just for this buffer
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = function(bufnr)
			local on_filetypes = { "nix", "lua", "luau", "zig" }
			if not vim.tbl_contains(on_filetypes, vim.bo[bufnr].filetype) then
				return
			end

			if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
				return
			end

			return { timeout_ms = 500, lsp_format = "fallback" }
		end,
		formatters = {
			qmlformat = {
				command = "qmlformat",
				args = { "$FILENAME" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			luau = { "stylua" },
			nix = { "alejandra" },
			zig = { "zigfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			rust = { "rustfmt" },
			elixir = { "mix" },
			gleam = { "gleam" },

			json = { "prettier" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			html = { "prettier" },

			qml = { "qmlformat" },
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
