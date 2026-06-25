return {
  -- 1. Install the Catppuccin plugin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Make sure it loads before other plugins
    config = function()
      require("catppuccin").setup({
        flavour = "macchiato", -- mocha, macchiato, frappe, latte
        transparent_background = false,
        integrations = {
          telescope = true,
          neotree = true,
          treesitter = true,
          notify = true,
          mini = true,
          -- add other integrations here
        },
      })

      -- Set the colorscheme
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- 2. Tell LazyVim to use Catppuccin as the default
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
