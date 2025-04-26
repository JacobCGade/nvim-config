return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				eslint_d = {
					-- Make sure eslint_d is used as a linter, not just a formatter
					command = vim.fn.expand("~/.local/share/nvim/mason/bin/eslint_d"),
					args = { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" },
					cwd = require("conform.util").root_file({
						".eslintrc",
						".eslintrc.js",
						".eslintrc.cjs",
						".eslintrc.json",
						"eslint.config.js",
						"eslint.config.mjs", -- Add this for flat config support
					}),
				},
			},
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 750,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range" })
	end,
}
