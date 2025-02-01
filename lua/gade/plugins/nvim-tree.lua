return {
    "nvim-tree/nvim-tree.lua",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      -- disable netrw to use nvim-tree instead
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      local nvimtree = require("nvim-tree")
      nvimtree.setup({
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
      })
      
      vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

    end
}
