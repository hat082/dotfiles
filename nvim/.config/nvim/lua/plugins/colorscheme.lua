return {
  "folke/tokyonight.nvim",
  opts = function(_, opts)
    opts.transparent = true
    opts.styles = {
      sidebars = "transparent",
      floats = "transparent",
    }
  end,
}
