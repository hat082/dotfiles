--- Uncomment the two plugins below if you want to manage the language servers from neovim

return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",

  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/nvim-cmp" },
    { "L3MON4D3/LuaSnip" },
  },

  config = function()
    local lsp_zero = require('lsp-zero')

    lsp_zero.on_attach(function(client, bufnr)
      -- see :help lsp-zero-keybindings
      -- to learn the available actions
      lsp_zero.default_keymaps({ buffer = bufnr })
      local opts = { buffer = bufnr }

      vim.keymap.set({ 'n', 'x' }, '<leader>lf', function()
        vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
      end, opts)
    end)

    lsp_zero.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = '»'
    })

    -- to learn how to use mason.nvim
    -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {},
      handlers = {
        function(server_name)
          require('lspconfig')[server_name].setup({})
        end,

        --- this is the "custom handler" for `example_server`
        --- in your own config you should replace `example_server`
        --- with the name of a language server you have installed
        -- example_server = function()
        --- in this function you can setup
        --- the language server however you want.
        --- in this example we just use lspconfig

        -- require('lspconfig').example_server.setup({
        ---
        -- in here you can add your own
        -- custom configuration
        ---
        -- })
        -- end,
      },
    })
  end
}
