return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	main = "nvim-treesitter.configs",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = { query = "@function.outer", desc = "ts function outer" },
					["if"] = { query = "@function.inner", desc = "ts function inner" },
					["ab"] = { query = "@block.outer", desc = "ts block outer" },
					["ib"] = { query = "@block.inner", desc = "ts block inner" },
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
				},
			},
		},
	},
}
