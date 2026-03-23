-- Mason setup (installs LSP servers)
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
})

-- Use blink.cmp capabilities if available, otherwise fallback to cmp-nvim-lsp
local has_blink, blink = pcall(require, 'blink.cmp')
local capabilities = has_blink
  and blink.get_lsp_capabilities()
  or require('cmp_nvim_lsp').default_capabilities()

-- Global config shared across all servers
vim.lsp.config('*', {
  capabilities = capabilities,
})

-- Lua-specific settings
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      telemetry = { enable = false },
    },
  },
})

-- Enable servers (replaces the lspconfig .setup() calls)
vim.lsp.enable({ 'lua_ls', 'rust_analyzer', 'pyright' })

-- Keymaps set on attach (replaces the on_attach function)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local bufnr = ev.buf
    local bufmap = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = bufnr })
    end

    bufmap('<leader>r', vim.lsp.buf.rename)
    bufmap('<leader>a', vim.lsp.buf.code_action)

    bufmap('gd', vim.lsp.buf.definition)
    bufmap('gD', vim.lsp.buf.declaration)
    bufmap('gI', vim.lsp.buf.implementation)
    bufmap('<leader>D', vim.lsp.buf.type_definition)

    bufmap('gr', require('telescope.builtin').lsp_references)
    bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
    bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)

    bufmap('K', vim.lsp.buf.hover)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, {})
  end,
})
