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

      --   l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "line diagnostics" },
      vim.keymap.set({ 'n', 'x' }, '<leader>ld',
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        opts)

      --   n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic" },
      --   p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic" },
      vim.keymap.set({ 'n', 'x' }, '<leader>lj',
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        opts)
      vim.keymap.set({ 'n', 'x' }, '<leader>lk',
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        opts)

      vim.keymap.set({ 'n', 'x' }, 'gd',
        require("telescope.builtin").lsp_definitions,
        opts)

      vim.keymap.set("n", "<leader>la", vim.diagnostic.setloclist, { desc = "Open diagnostic Quickfix list" })
      --   R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
      vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename Symbol" })

      --   b = { "<cmd>Telescope diagnostics bufnr=0<CR>", "buffer diagnostics" },
      --   c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
      --   d = { "<cmd>Telescope lsp_definitions<CR>", "definition" },
      --   D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "declaration" },
      --   h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "help" },
      --   i = { "<cmd>Telescope lsp_implementations<CR>", "implementations" },
      --   k = { "<cmd>LspStop<CR>", "kill lsp" },
      --   l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "line diagnostics" },
      --   n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next diagnostic" },
      --   p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "previous diagnostic" },
      --   r = { "<cmd>Telescope lsp_references<CR>", "references" },
      --   s = { "<cmd>LspRestart<CR>", "restart lsp" },
      --   t = { "<cmd>LspStart<CR>", "start lsp" },
      --   R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
      --   T = { "<cmd>Telescope lsp_type_definitions<CR>", "type definition" },
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
