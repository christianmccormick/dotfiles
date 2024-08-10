local colorscheme_palette = require("nightfox.palette").load("nightfox")

require("lualine").setup({
  options = {
    tab_seperators = "",
  },
  sections = {
    lualine_a = { {
      "mode",
      fmt = function(str)
        return str:sub(1, 1)
      end,
    } },
    lualine_b = { "branch" },
    lualine_c = {
      "diff",
      {
        "diagnostics",
        symbols = { error = " ", warn = " ", hint = " ", info = " " },
      },
    },
  },
  inactive_sections = {
    lualine_c = {},
  },
  extensions = {
    "fugitive",
    "nvim-tree",
    "quickfix",
  },
})
