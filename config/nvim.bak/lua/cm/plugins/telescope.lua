custom_pickers = require("cm.plugins.telescope.custom_pickers")

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {
      ".git/",
      "tags",
      "tags.lock",
      "tags.temp",
      "tags.temp.tmp",
      "vendor/",
      "tmp/",
      "log/",
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
    live_grep = {
      mappings = {
        i = {
          ["<C-f>"] = custom_pickers.actions.set_extension,
          ["<C-l>"] = custom_pickers.actions.set_folders,
        },
      },
    },
  },
})
