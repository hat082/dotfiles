return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    vim.keymap.set('n', '<leader>e', ':Neotree focus filesystem left<CR>')
    require('neo-tree').setup({
      window = {
        mappings = {
          ['<leader>e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
          ['<leader>b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          ['<leader>g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
        },
      },
    })
  end
}
