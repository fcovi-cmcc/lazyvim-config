return {
  "saghen/blink.cmp",
  opts = {

    -- Remap autocompletion keybind from ENTER to TAB
    keymap = {
      preset = "none", -- We define our own to avoid conflicts

      ["<Tab>"] = { "accept", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      
      -- These allow you to navigate the menu with arrows or Ctrl-n/p
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },

      -- Disable Enter (CR) so it just creates a new line
      ["<CR>"] = { "fallback" },
      
      -- Optional: Show the documentation scroll
      ["<C-b>"] = { "scroll_documentation_up", "fallback" },
      ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    },
    
    -- Remove ghost text from autocompletion
    completion = {
      ghost_text = { enabled = false },
    },
  },
}


