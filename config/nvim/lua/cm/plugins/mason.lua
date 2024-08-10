-- automatically install lsp servers

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = {
    exclude = { "solargraph" },
  },
})

local on_attach = function(client, bufnr)
  local opts = { buffer = 0, silent = true }

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

  -- if client.name == 'tsserver' or client.name == 'eslint' then
  --   client.server_capabilities.document_formatting = false
  --   client.server_capabilities.document_range_formatting = false
  -- end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- ruby

require("lspconfig").ruby_lsp.setup({
  capabilities = capabilities,
  init_options = {
    formatter = "syntax_tree",
  },
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil -- disable lsp syntax highligting
  end,
  on_attach = on_attach,
})

-- javascript / typescript

require("typescript-tools").setup({ capabilities = capabilities, on_attach = on_attach })

-- eslint

require("lspconfig").eslint.setup({
  settings = {
    validate = "on",
    codeAction = {
      disableRuleComment = {
        location = "separateLine",
      },
      showDocumentation = {
        enable = true,
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
})

-- lua

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      runtime = { path = runtime_path },
      diagnostics = { globals = { "vim", "hs" } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      format = { enable = true },
      telemetry = { enable = false },
    },
  },
  on_attach = on_attach,
})
