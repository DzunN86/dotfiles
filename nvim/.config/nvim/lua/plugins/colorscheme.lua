return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = function()
      return {
        transparent_mode = true,
      }
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
