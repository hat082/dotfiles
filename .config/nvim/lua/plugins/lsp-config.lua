return {
  {
    "williamboman/mason.nvim", -- Plugin for managing Neovim configurations
    config = function()
      require("mason").setup() -- Set up the mason plugin
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",                -- Plugin for linking Mason with LSP configurations
    config = function()
      require("mason-lspconfig").setup({                -- Configure mason-lspconfig plugin
        ensure_installed = { "lua_ls", "clangd", "cmake" }, -- Ensure the specified language servers are installed
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",                                           -- Official LSP configuration for Neovim
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Set up default capabilities for LSP
      local lspconfig = require("lspconfig")                           -- Load the lspconfig module

      lspconfig.lua_ls.setup({                                         -- Configure lua language server
        capabilities = capabilities,                                   -- Assign the default capabilities
      })
      lspconfig.clangd.setup({                                         -- Configure clangd language server
        capabilities = capabilities,                                   -- Assign the default capabilities
      })
      lspconfig.cmake.setup({                                          -- Configure cmake language server
        capabilities = capabilities,                                   -- Assign the default capabilities
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})                      -- Map key 'K' to show hover information
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})                -- Map key 'gd' to go to definition
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {}) -- Map key '<leader>ca' to trigger code actions
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})            -- Map key '<leader>lf' to format the document
    end,
  },
}

