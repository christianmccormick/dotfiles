return {
  "zbirenbaum/copilot.lua",
  opts = {
    copilot_node_command = vim.fn.system("devbox global path"):gsub("%s+$", "")
      .. "/.devbox/nix/profile/default/bin/node",
    suggestion = {
      auto_trigger = true,
    },
  },
}
