return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()    
      vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope's find files" })
      vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope's live grep" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
              }
            }
          }
        }
      require("telescope").load_extension("ui-select")
    end
  },
}
