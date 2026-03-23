My nvim setup
-------------

Plugin manager: lazy.nvim. Config entry point: `init.lua`.

Structure:
- `lua/fdb/` — editor settings and keymaps
- `lua/pluginlist.lua` — all plugin definitions
- `after/plugin/` — per-plugin configuration loaded after startup

Plugins
-------

### LSP

**neovim/nvim-lspconfig**
Collection of LSP server configurations; provides the `cmd`, filetypes, and root detection that `vim.lsp.enable()` relies on.
- `gd` — go to definition
- `K` — hover documentation
- `<leader>r` — rename symbol

**williamboman/mason.nvim**
Portable package manager for installing LSP servers, linters, and formatters from inside Neovim.
- `:Mason` — open the Mason UI
- `:MasonInstall <name>` — install a package
- `:MasonUpdate` — update all installed packages

**williamboman/mason-lspconfig.nvim**
Bridge between mason.nvim and nvim-lspconfig; ensures configured servers are auto-installed.
- `:LspInfo` — show active LSP clients for the current buffer
- `:LspStart` — manually start the LSP for the current buffer
- `:LspStop` — stop the LSP for the current buffer

### Completion

**saghen/blink.cmp**
Fast completion engine backed by a Rust fuzzy matcher; primary completion plugin.
- `<C-Space>` — open the completion menu
- `<C-n>` / `<C-p>` — select next / previous item
- `<C-y>` — accept the selected item

**hrsh7th/nvim-cmp** + **hrsh7th/cmp-nvim-lsp**
Fallback completion engine and its LSP source (used if blink.cmp is unavailable).
- `<C-Space>` — trigger completion
- `<C-n>` / `<C-p>` — navigate items
- `<C-e>` — close the completion menu

### Syntax & Navigation

**nvim-treesitter/nvim-treesitter**
Incremental parsing for accurate syntax highlighting, indentation, and text objects across many languages.
- `:TSInstall <lang>` — install a language parser
- `:TSUpdate` — update all installed parsers
- `:InspectTree` — open the parse tree for the current buffer

**nvim-treesitter/playground**
Interactive viewer for the tree-sitter parse tree and highlight captures of the current buffer.
- `:TSPlaygroundToggle` — open / close the playground pane
- `:TSHighlightCapturesUnderCursor` — show highlight groups under cursor
- `:TSNodeUnderCursor` — print the node name under the cursor

**nvim-telescope/telescope.nvim**
Highly extensible fuzzy finder for files, grep, buffers, LSP symbols, and more.
- `<leader>ff` — find files
- `<leader>fg` — live grep across the project
- `<leader>fb` — switch between open buffers

### File & Project Management

**nvim-neo-tree/neo-tree.nvim**
File explorer sidebar with git status integration and a clean tree layout.
- `:Neotree toggle` — open / close the file tree
- `:Neotree reveal` — reveal the current file in the tree
- `<leader>ld` — open netrw (built-in fallback explorer)

**tpope/vim-fugitive**
Full Git client inside Neovim; run any `git` subcommand via `:Git`.
- `<leader>gs` — open Git status window
- `:Git commit` — open commit message editor
- `:Git push` — push to remote

**mbbill/undotree**
Visualises the full undo history as a branching tree so no edits are ever truly lost.
- `<leader>u` — toggle the undotree panel
- `u` / `<C-r>` — undo / redo (navigate the tree)
- `<CR>` (in panel) — jump to the selected undo state

### Language-specific

**rust-lang/rust.vim**
Rust file detection, syntax highlighting, and `rustfmt` integration.
- `:RustFmt` — format the current file with rustfmt
- `:RustRun` — compile and run the current file
- `:RustTest` — run the tests for the current file

**Olical/conjure**
Interactive REPL evaluation for Lisps (Scheme, Clojure, Fennel, etc.) via a persistent log buffer.
- `<localleader>ee` — evaluate the form under the cursor
- `<localleader>eb` — evaluate the entire buffer
- `<localleader>lg` — jump to the Conjure log buffer

**julienvincent/nvim-paredit**
Structural editing for S-expressions: slurp, barf, and splice without breaking parentheses balance.
- `>)` — slurp: pull the next form into the current list
- `<)` — barf: push the last form out of the current list
- `<localleader>w` — wrap the form under cursor in a new list

### UI & Editing

**HiPhish/rainbow-delimiters.nvim**
Colours nested brackets and delimiters in distinct hues to make structure immediately visible.
- Enabled automatically; no commands needed
- `:lua require('rainbow-delimiters').toggle(0)` — toggle for current buffer
- `:hi RainbowDelimiterRed` — inspect / override a highlight group

**numToStr/Comment.nvim**
Toggle line and block comments with a single motion, supporting any language treesitter knows.
- `gcc` — toggle comment on the current line
- `gc` (visual) — toggle comment on the selected lines
- `gbc` — toggle a block comment around the current line

**catppuccin/nvim**
Soothing pastel colour scheme with four flavours (latte, frappé, macchiato, mocha).
- `:colorscheme catppuccin` — apply default (mocha) theme
- `:colorscheme catppuccin-latte` — switch to light variant
- `:colorscheme catppuccin-macchiato` — switch to macchiato variant

Key mappings reference
----------------------

| Key | Action |
|-----|--------|
| `<leader>` | Space |
| `<localleader>` | `\` |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | Buffers (Telescope) |
| `<leader>fh` | Help tags (Telescope) |
| `<leader>gt` | Git files (Telescope) |
| `<leader>fpf` | Grep with prompt (Telescope) |
| `<leader>gs` | Git status (Fugitive) |
| `<leader>u` | Toggle undotree |
| `<leader>ld` | Open file explorer |
| `<leader>r` | LSP rename |
| `<leader>a` | LSP code actions |
| `<leader>s` | LSP document symbols |
| `<leader>S` | LSP workspace symbols |
| `<leader>D` | LSP type definition |
| `gd` | LSP go to definition |
| `gD` | LSP go to declaration |
| `gI` | LSP go to implementation |
| `gr` | LSP references (Telescope) |
| `K` | LSP hover |
| `:Format` | Format buffer via LSP |
| `gcc` | Toggle line comment |
| `<Tab>` | Window navigation (`<C-w>`) |
| `<C-c>` | Clear search highlights |
