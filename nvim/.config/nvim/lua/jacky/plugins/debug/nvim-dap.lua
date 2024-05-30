return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
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

      keymap.set('n', '<Leader>dd', dap.toggle_breakpoint, { desc = "[D]ebugger [T]oggle Breakpoint" })
      keymap.set('n', '<Leader>dc', dap.continue, { desc = "[D]ebugger [C]ontinue" })
      keymap.set('n', '<Leader>dr', "<cmd>CMakeDebug<CR>", { desc = "Cmake [D]ebugger [R]un" })
      -- step into
      keymap.set('n', '<Leader>dl', dap.step_into, { desc = "[D]ebugger Step [I]nto" })
      -- step over
      keymap.set('n', '<Leader>dj', dap.step_over, { desc = "[D]ebugger Step [O]ver" })
      -- step out
      keymap.set('n', '<Leader>dh', dap.step_out, { desc = "[D]ebugger Step [O]ut" })

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
