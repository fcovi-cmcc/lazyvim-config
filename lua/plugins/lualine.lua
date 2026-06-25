return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    local colors = require("catppuccin.palettes").get_palette("macchiato") -- match your flavor: latte/frappe/macchiato/mocha

    local mode_colors = {
      normal = colors.blue,
      insert = colors.green,
      visual = colors.mauve,
      replace = colors.red,
      command = colors.peach,
      terminal = colors.teal,
    }

    opts.sections.lualine_a = {
      {
        "mode",
        color = function()
          local mode_map = {
            n = mode_colors.normal,
            i = mode_colors.insert,
            v = mode_colors.visual,
            V = mode_colors.visual,
            [""] = mode_colors.visual,
            R = mode_colors.replace,
            c = mode_colors.command,
            t = mode_colors.terminal,
          }
          local mode = vim.fn.mode()
          return { bg = mode_map[mode] or mode_colors.normal, fg = colors.base, gui = "bold" }
        end,
      },
    }

    return opts
  end,
}
