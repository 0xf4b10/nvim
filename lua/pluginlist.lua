--

return {
  "neovim/nvim-lspconfig",
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/nvim-cmp",
  "rust-lang/rust.vim",


  --"williamboman/mason.nvim",
  "mbbill/undotree",
  "HiPhish/rainbow-delimiters.nvim",
  -- "Olical/conjure",

  {
    'tpope/vim-fugitive',
  },
  {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    }
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    'nvim-treesitter/playground',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Design packs, fonts and other
  -- niceness.
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme catppuccin")
    end
  },
}
