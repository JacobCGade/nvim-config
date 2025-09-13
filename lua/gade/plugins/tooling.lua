return {
	"olexsmir/gopher.nvim",
	ft = "go",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function(_, opts)
		require("gopher").setup(opts)

		vim.keymap.set("n", "<leader>gsj", "<cmd> GoTagAdd json <CR>", {})
	end,
	-- branch = "develop"
	-- (optional) will update plugin's deps on every update
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
