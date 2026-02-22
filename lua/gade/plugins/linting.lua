return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				go = { "golangcilint" },
			}

			-- Run golangci-lint from the Go module root so it can find go.mod
			lint.linters.golangcilint.ignore_exitcode = true

			-- Build opts with cwd for Go files
			local function lint_opts()
				local root = vim.fs.root(0, { "go.mod", "go.work" })
				if root then
					return { cwd = root }
				end
				return {}
			end

			-- Run lint automatically
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					lint.try_lint(nil, lint_opts())
				end,
			})

			-- Also lint after filetype detection on read
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					vim.defer_fn(function()
						lint.try_lint(nil, lint_opts())
					end, 100)
				end,
			})

			-- Add a keybinding for manual linting
			vim.keymap.set("n", "<leader>el", function()
				lint.try_lint(nil, lint_opts())
			end, { desc = "Run linter" })
		end,
	},
}
