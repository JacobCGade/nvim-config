# Neovim Configuration

A modern Neovim configuration with LSP support, autocompletion, and developer-friendly features.

## Features

- **LSP Support**: Full Language Server Protocol support with diagnostics display
- **Auto-completion**: Smart code completion with nvim-cmp
- **File Navigation**: Telescope for fuzzy finding files and text
- **Git Integration**: Git signs and status in the editor
- **Debugging**: DAP (Debug Adapter Protocol) support
- **Formatting & Linting**: Automatic code formatting and linting
- **Syntax Highlighting**: Treesitter-based syntax highlighting

## Structure

```
.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   └── gade/
│       ├── core/           # Core configuration
│       │   ├── init.lua    # Core module loader
│       │   ├── keymaps.lua # Key mappings
│       │   └── options.lua # Vim options
│       ├── lazy.lua        # Lazy.nvim plugin manager setup
│       └── plugins/        # Plugin configurations
│           ├── alpha-nvim.lua    # Startup screen
│           ├── colorscheme.lua   # Color theme
│           ├── completions.lua   # Auto-completion
│           ├── debugging.lua     # DAP debugger
│           ├── formatting.lua    # Code formatting
│           ├── init.lua         # Plugin loader
│           ├── linting.lua      # Code linting
│           ├── lsp-config.lua   # LSP configuration
│           ├── lualine.lua      # Status line
│           ├── nvim-tree.lua    # File explorer
│           ├── telescope.lua    # Fuzzy finder
│           ├── tooling.lua      # Development tools
│           └── treesitter.lua   # Syntax highlighting
└── lazy-lock.json          # Plugin version lock file
```

## Key Bindings

### General
- `<Space>` - Leader key
- `jk` - Exit insert mode
- `<leader>nh` - Clear search highlights

### Window Management
- `<leader>sv` - Split window vertically
- `<leader>sh` - Split window horizontally
- `<leader>se` - Make splits equal size
- `<leader>sx` - Close current split

### Tabs
- `<leader>to` - Open new tab
- `<leader>tx` - Close current tab
- `<leader>tn` - Go to next tab
- `<leader>tp` - Go to previous tab
- `<leader>tf` - Open current buffer in new tab

### File Navigation
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Live grep (Telescope)
- `-` - Open parent directory in Oil (edit filesystem like a buffer)
- `<leader>-` - Open Oil in floating window

### LSP Features
- `gd` - Go to definition
- `gD` - Go to declaration
- `gi` - Go to implementation
- `gr` - Find references
- `K` - Show hover documentation
- `<C-k>` - Show signature help
- `<space>D` - Go to type definition
- `<space>rn` - Rename symbol
- `<space>ca` - Code actions
- `<space>f` - Format code

### Diagnostics
- `<space>e` - Show diagnostic in floating window
- `[d` - Go to previous diagnostic
- `]d` - Go to next diagnostic
- `<space>q` - Add diagnostics to location list

### Go-specific Commands
Available when editing Go files:
- `<leader>gd` - Add package documentation comment
- `<leader>gc` - Add comment for function/type
- `<leader>ge` - Add `if err != nil` check
- `<leader>gt` - Add struct tags (json, xml, etc.)
- `<leader>gr` - Remove struct tags
- `<leader>gi` - Implement interface
- `<leader>gf` - Fill struct with default values
- `<leader>gg` - Run go generate

## Language Servers

The following language servers are configured:

- **Go**: `gopls` - Full Go language support with auto-imports and analysis
- **TypeScript/JavaScript**: `ts_ls` - TypeScript and JavaScript support
- **Lua**: `lua_ls` - Lua language server

Language servers are automatically installed via Mason when you open a supported file type.

## Diagnostics Display

LSP diagnostics are displayed in multiple ways:

1. **Inline Virtual Text**: Errors and warnings appear at the end of problematic lines
2. **Sign Column**: Icons in the left gutter indicate diagnostic severity:
   - 🔴 Error
   - 🟡 Warning
   - 💡 Hint
   - ℹ️ Info
3. **Underline**: Problematic code is underlined
4. **Status Line**: Diagnostic counts appear in the lualine status bar
5. **Floating Windows**: Press `<space>e` to see detailed diagnostic messages

## Requirements

- Neovim >= 0.9.0
- Git
- Node.js (for many language servers)
- A [Nerd Font](https://www.nerdfonts.com/) for icons

## Installation

1. Backup your existing Neovim configuration:
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. Clone or copy this configuration to `~/.config/nvim/`

3. Start Neovim - plugins will auto-install on first launch

4. Install language servers via Mason:
   ```vim
   :Mason
   ```

## Troubleshooting

### Diagnostics not showing

If diagnostics aren't visible:
1. Check that the language server is running: `:LspInfo`
2. Verify the file type is correct: `:set filetype?`
3. Look for errors in `:messages`
4. Ensure the language server for your file type is installed via `:Mason`