-- Mason setup
require("mason").setup()

local on_attach = function(_, bufnr)
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
end

-- Use blink.cmp capabilities if available, otherwise fallback to default
local capabilities = {}
local has_blink, blink = pcall(require, 'blink.cmp')
if has_blink then
  capabilities = blink.get_lsp_capabilities()
else
  capabilities = require('cmp_nvim_lsp').default_capabilities()
end

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "pyright"
  },
  handlers = {
    -- Default handler for all servers
    function(server_name)
      require("lspconfig")[server_name].setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
    end,

    -- Custom handler for lua_ls
    ["lua_ls"] = function()
      require("lspconfig").lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
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
      }
    end,
  },
})
