return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSupdate",
  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      auto_install = true,
      ensure_installed = { "lua", "cpp", "python" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
