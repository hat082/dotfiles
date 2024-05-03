return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-t>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    })
  end,
}
