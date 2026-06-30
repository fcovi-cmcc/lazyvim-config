return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical",
        split_ratio = 0.4, -- 40% of screen width
      },
    })
  end,
  keys = {
    { "<leader>ai", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude Code" },
  },
}
