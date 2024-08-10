local null_ls = require("null-ls")

require("null-ls").setup({
  sources = {
    null_ls.builtins.diagnostics.rubocop.with({
      command = "bundle",
      args = vim.list_extend({ "exec", "rubocop" }, null_ls.builtins.diagnostics.rubocop._opts.args),
    }),
    null_ls.builtins.formatting.stylua,
  },
})
