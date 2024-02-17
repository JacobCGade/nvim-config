require("lazy").setup({
    { "catppuccin/nvim", name = "catppuccin", priority = 1000},
    "nvim-treesitter/nvim-treesitter",
    { 
        "nvim-telescope/telescope.nvim", tag = '0.1.5',
        dependencies = { "nvim-lua/plenary.nvim" }
    },
})
