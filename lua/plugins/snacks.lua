return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Enable the terminal feature
    terminal = {
      enabled = true,
      win = {
        position = "bottom", -- Opens at the bottom
        height = 15,         -- YOUR REQUEST: Sets the default height to 15 lines
      },
    },
    -- You can enable other cool Snacks features here too
    notifier = { enabled = true },
    dashboard = { enabled = true },
    input = { enabled = true },
  },
}
