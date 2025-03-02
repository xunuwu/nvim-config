return {
	{
		"echasnovski/mini.trailspace",
		version = "*",
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"echasnovski/mini.align",
		version = "*",
		opts = {},
		keys = {
			{ "ga", mode = { "n", "v" } },
			{ "gA", mode = { "n", "v" } },
		},
	},
	{
		"echasnovski/mini.icons",
		version = "*",
		lazy = true,
		config = function()
			require("mini.icons").setup()
			MiniIcons.tweak_lsp_kind()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
	{
		"echasnovski/mini.statusline",
		event = "UIEnter",
		dependencies = { "echasnovski/mini.icons" },
		version = "*",
		opts = {},
	},
	{
		"echasnovski/mini.pick",
		version = "*",
		dependencies = { "echasnovski/mini.icons" },
		opts = {
			options = { use_cache = true },
			window = {
				config = function()
					return {
						col = math.floor(0.5 * (vim.o.columns - math.floor(0.618 * vim.o.columns))),
						width = math.floor(0.618 * vim.o.columns),
					}
				end,
			},
		},
		keys = {
			{
				"<leader>sf",
				function()
					MiniPick.builtin.files()
				end,
			},
			{
				"<leader>sd",
				function()
					MiniPick.builtin.grep_live()
				end,
			},
			{
				"<leader>sh",
				function()
					MiniPick.builtin.help()
				end,
			},
			{
				"<leader>sb",
				function()
					MiniPick.builtin.buffers()
				end,
			},
		},
	},
	{
		"echasnovski/mini.files",
		version = "*",
		event = { "BufEnter" },
		dependencies = { "echasnovski/mini.icons" },
		opts = { window = { preview = true } },
		keys = {
			{
				"<leader>e",
				function()
					MiniFiles.open(vim.fn.expand("%:h"))
				end,
				{ desc = "Explore files" },
			},
		},
	},
}
