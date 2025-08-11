return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    servers = {
      astro = {},
      cssls = {},
      css_variables = {},
      lua_ls = {
        root_dir = function(fname)
          local lspconfig = require("lspconfig")
          local default_root_dir = lspconfig.lua_ls.document_config.default_config.root_dir
          local root = default_root_dir(fname)

          if
            root and vim.fn.filereadable(root .. "/.stylua.toml") == 1
            or vim.fn.filereadable(root .. "/stylua.toml") == 1
          then
            return nil
          end

          return root
        end,
      },
      ruby_lsp = {
        -- cmd = { "direnv", "exec", ".", "ruby", "-S", "ruby-lsp" },
        init_options = {
          formatter = "syntax_tree",
        },
      },
      rubocop = {},
      syntax_tree = {
        cmd = { "bundle", "exec", "stree", "lsp" },
      },
      eslint = {},
      jsonls = {
        handlers = {
          ["workspace/diagnostic/refresh"] = function()
            return {}
          end,
        },
      },
    },
  },
}
