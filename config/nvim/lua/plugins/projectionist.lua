return {
  "tpope/vim-projectionist",
  config = function()
    vim.g.projectionist_heuristics = {
      ["*"] = {
        ["app/*.rb"] = {
          type = "source",
          alternate = { "test/{}_test.rb", "spec/{}_spec.rb" },
        },
        ["test/*_test.rb"] = {
          type = "test",
          alternate = "app/{}.rb",
        },
        ["spec/*_spec.rb"] = {
          type = "test",
          alternate = "app/{}.rb",
        },
        ["app/*.js"] = {
          type = "source",
          alternate = { "test/{}_test.js", "spec/{}_spec.js" },
        },
        ["test/*_test.js"] = {
          type = "test",
          alternate = "app/{}.js",
        },
        ["spec/*_spec.js"] = {
          type = "test",
          alternate = "app/{}.js",
        },
        ["app/*.ts"] = {
          type = "source",
          alternate = { "test/{}_test.ts", "spec/{}_spec.ts", "test/{}.test.ts", "spec/{}.test.ts" },
        },
        ["test/*_test.ts"] = {
          type = "test",
          alternate = "app/{}.ts",
        },
        ["spec/*_spec.ts"] = {
          type = "test",
          alternate = "app/{}.ts",
        },
        ["test/*.test.ts"] = {
          type = "test",
          alternate = "app/{}.ts",
        },
        ["spec/*.test.ts"] = {
          type = "test",
          alternate = "app/{}.ts",
        },
      },
    }

    local wk = require("which-key")

    wk.add({
      { "<leader>A", group = "alternate" },
    })

    vim.keymap.set("n", "<leader>A", ":A<cr>", { desc = "Open alternate", silent = true })
  end,
}
