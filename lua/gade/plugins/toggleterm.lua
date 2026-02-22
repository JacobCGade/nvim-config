return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = nil, -- Disabled, using <leader>tt instead
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Terminal keymaps
    function _G.set_terminal_keymaps()
      local opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- Custom terminals
    local Terminal = require("toggleterm.terminal").Terminal

    -- Lazygit terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    function _LAZYGIT_TOGGLE()
      lazygit:toggle()
    end

    -- Python terminal
    local python = Terminal:new({
      cmd = "python3",
      direction = "horizontal",
      hidden = true,
    })

    function _PYTHON_TOGGLE()
      python:toggle()
    end

    -- Node terminal
    local node = Terminal:new({
      cmd = "node",
      direction = "horizontal",
      hidden = true,
    })

    function _NODE_TOGGLE()
      node:toggle()
    end

    local function toggle_term(cmd)
      return function()
        vim.cmd("silent! w")
        vim.cmd(cmd)
        vim.schedule(function()
          if vim.bo.buftype == "terminal" then
            vim.cmd("startinsert")
          end
        end)
      end
    end

    -- Keymaps for different terminal types
    vim.keymap.set("n", "<leader>tt", toggle_term("ToggleTerm"), { desc = "Toggle terminal" })
    vim.keymap.set("n", "<leader>tf", toggle_term("ToggleTerm direction=float"), { desc = "Float terminal" })
    vim.keymap.set("n", "<leader>th", toggle_term("ToggleTerm size=15 direction=horizontal"), { desc = "Horizontal terminal" })
    vim.keymap.set("n", "<leader>tg", toggle_term("lua _LAZYGIT_TOGGLE()"), { desc = "Lazygit" })

    -- Multiple terminals
    vim.keymap.set("n", "<leader>t2", toggle_term("2ToggleTerm"), { desc = "Terminal 2" })
    vim.keymap.set("n", "<leader>t3", toggle_term("3ToggleTerm"), { desc = "Terminal 3" })
  end,
}