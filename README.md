My nvim setup
-------------

I use lazyvim as package manager.

* init.lua
* lua
* after

Relevant plugins
----------------

"neovim/nvim-lspconfig"

Nvim supports the Language Server Protocol (LSP), which means it acts as a
client to LSP servers and includes a Lua framework vim.lsp for building
enhanced LSP tools.

nvim-lspconfig is a collection of LSP server configurations for the Nvim LSP
client

"mason-org/mason.nvim"

Portable package manager for Neovim that runs everywhere Neovim runs.
Easily install and manage LSP servers, DAP servers, linters, and
formatters.

"mason-org/mason-lspconfig.nvim"

Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.

'nvim-treesitter/nvim-treesitter'

The goal of nvim-treesitter is both to provide a simple and easy way to use the
interface for tree-sitter in Neovim and to provide some basic functionality
such as highlighting based on it.

'nvim-telescope/telescope.nvim',
telescope.nvim is a highly extendable fuzzy finder over lists. 

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",

"rust-lang/rust.vim"

This is a Vim plugin that provides Rust file detection, syntax highlighting,
formatting.

  "mbbill/undotree",

  "HiPhish/rainbow-delimiters.nvim",
  -- "Olical/conjure",

    'tpope/vim-fugitive',
    'numToStr/Comment.nvim',

Dependencies
------------
