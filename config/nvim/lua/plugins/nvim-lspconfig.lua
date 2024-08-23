return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      virtual_text = false,
    },
    servers = {
      ruby_lsp = {
        init_options = {
          formatter = "syntax_tree",
        },
      },
      eslint = {},
    },
  },
}
