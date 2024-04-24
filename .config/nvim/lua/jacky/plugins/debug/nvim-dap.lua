return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      ensure_installed = { 'stylua', 'jq' },
      handlers = {
        function(config)
          -- all sources with no handler get passed here

          -- Keep original functionality
          require('mason-nvim-dap').default_setup(config)
        end,
        cpp = function(config)
          config.adapters = {}
          require('mason-nvim-dap').default_setup(config) -- don't forget this!
        end,
      },
    },
  },
  {
    -- dap
    "mfussenegger/nvim-dap",
  },
  {
    -- dap ui
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap"
    },

    event = "VeryLazy",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      local keymap = vim.keymap

      dapui.setup()

      keymap.set('n', '<Leader>dt', dap.toggle_breakpoint)
      keymap.set('n', '<Leader>dc', dap.continue)

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end
  },
}
