return {
  { "mfussenegger/nvim-dap", enabled = true },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { 
        "python", 
        "node2"
      },
      automatic_installation = true,
      handlers = {
        python = function(source_name)
          local dap = require "dap"
          dap.adapters.python = {
            type = "executable",
            command = "python3",
            args = {
              "-m",
              "debugpy.adapter",
            },
          }

          dap.configurations.python = {
            {
              type = "python",
              request = "launch",
              name = "Launch file",
              program = "${file}", -- This configuration will launch the current file if used.
            },
          }
        end,
        node2 = function(source_name)
          local dap = require "dap"
          dap.adapters.node2 = {
            type = 'executable',
	          command = vim.fn.exepath('node-debug2-adapter'),
          }

          dap.configurations.node2 = {
            {
              name = 'Node2: Launch',
		          type = 'node2',
		          request = 'launch',
		          program = '${file}',
		          cwd = vim.fn.getcwd(),
		          sourceMaps = true,
		          protocol = 'inspector',
		          console = 'integratedTerminal',
            },
          }
        end,
      },
    }
  }
}
