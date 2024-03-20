return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find file
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, {}) -- find word (live grep)
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
            -- even more opts
          }
        }
      }
    })
    require("telescope").load_extension("ui-select")
    end
  }
}
