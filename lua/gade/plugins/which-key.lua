return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = false,
          text_objects = false,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },
    })

    -- Document existing key chains using new spec format
    wk.add({
      { "<leader>c", group = "Code" },
      { "<leader>e", group = "Errors/Diagnostics" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Go" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>m", group = "Format" },
      { "<leader>r", group = "Rename" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Tab/Toggle" },
      { "<leader>w", group = "Workspace" },
    })
  end,
}