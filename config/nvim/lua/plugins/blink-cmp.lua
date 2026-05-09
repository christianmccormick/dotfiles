return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      ghost_text = {
        enabled = true, -- Keep ghost text enabled in normal mode
      },
    },
    cmdline = {
      enabled = true,
      completion = {
        ghost_text = {
          enabled = false, -- Disable ghost text in cmdline mode to prevent crash
        },
      },
    },
  },
}
