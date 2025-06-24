return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    servers = {
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
        init_options = {
          formatter = "syntax_tree",
        },
      },
      eslint = {},
    },
  },
}
