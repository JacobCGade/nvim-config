return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 100,
      filetype_overrides = {},
      filetypes_denylist = {
        "dirvish",
        "fugitive",
        "alpha",
        "NvimTree",
        "lazy",
        "neogitstatus",
        "Trouble",
        "lir",
        "Outline",
        "spectre_panel",
        "toggleterm",
        "DressingSelect",
        "TelescopePrompt",
      },
      under_cursor = true,
      large_file_cutoff = nil,
      large_file_overrides = nil,
      min_count_to_highlight = 1,
    })

    -- Change highlight colors
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3b4261" })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3b4261" })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3b4261" })
  end,
}