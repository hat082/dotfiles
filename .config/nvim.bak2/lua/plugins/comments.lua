return {
  "numToStr/Comment.nvim",
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Comment line" }
  },
  config = function()
    require("Comment").setup()
  end
}
