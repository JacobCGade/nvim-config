return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      goimports = false, -- Disable, using conform.nvim instead
      gofmt = false, -- Disable, using conform.nvim instead
      tag_transform = false,
      test_dir = "",
      comment_placeholder = "   ",
      lsp_cfg = false, -- false: use your own lspconfig
      lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = nil, -- use on_attach from lspconfig
      dap_debug = false,
      -- Disable specific features that might conflict
      lsp_document_formatting = false,
      diagnostic = false, -- Let our existing config handle diagnostics
    })

    -- Go specific keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        -- Quick actions for common Go tasks
        vim.keymap.set("n", "<leader>gc", "<cmd>GoCmt<cr>", { buffer = true, desc = "Add Go comment" })
        vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<cr>", { buffer = true, desc = "Add if err != nil" })
        vim.keymap.set("n", "<leader>gt", "<cmd>GoAddTag<cr>", { buffer = true, desc = "Add struct tags" })
        vim.keymap.set("n", "<leader>gr", "<cmd>GoRmTag<cr>", { buffer = true, desc = "Remove struct tags" })
        vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<cr>", { buffer = true, desc = "Implement interface" })
        vim.keymap.set("n", "<leader>gf", "<cmd>GoFillStruct<cr>", { buffer = true, desc = "Fill struct" })
        vim.keymap.set("n", "<leader>gg", "<cmd>GoGenerate<cr>", { buffer = true, desc = "Go generate" })

        -- For package documentation specifically
        vim.keymap.set("n", "<leader>gd", function()
          local line = vim.api.nvim_get_current_line()
          if line:match("^package") then
            vim.api.nvim_buf_set_lines(0, 0, 0, false, {
              "// Package " .. line:match("package%s+(%w+)") .. " provides TODO: add description",
            })
          end
        end, { buffer = true, desc = "Add package documentation" })
      end,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}