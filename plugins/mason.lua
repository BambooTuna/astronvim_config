-- customize mason plugins
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        "dockerls",
        "pyright",
        "tsserver",
        "gopls",
        "terraformls",
        "prismals",
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        -- Formatters
        "prettier",
        -- "prettierd",
        "yamlfmt",
        "black",
        "terraform_fmt",

        -- Linter
        "mypy",
        "eslint_d",
        "flake8",
      },
      automatic_installation = true,
      automatic_setup = false,
      handlers = {
        -- for prettier
        prettier = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettier.with {
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".prettierrc"
                or utils.root_has_file ".prettierrc.json"
                or utils.root_has_file ".prettierrc.js"
            end,
          })
        end,
        -- For eslint_d:
        eslint_d = function()
          require("null-ls").register(require("null-ls").builtins.formatting.eslint_d.with {
            condition = function(utils)
              return (
                utils.root_has_file ".eslintrc"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
              )
                and not (
                  utils.root_has_file ".prettierrc"
                  or utils.root_has_file ".prettierrc.json"
                  or utils.root_has_file ".prettierrc.js"
                )
            end,
          })
          require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
            method = require("null-ls").methods.DIAGNOSTICS_ON_SAVE,
            diagnostic_config = {
                underline = true,
                virtual_text = false,
                signs = true,
                update_in_insert = false,
                severity_sort = true,
            },
            condition = function(utils)
              return utils.root_has_file "package.json"
                or utils.root_has_file ".eslintrc"
                or utils.root_has_file ".eslintrc.json"
                or utils.root_has_file ".eslintrc.js"
            end,
          })
          require("null-ls").register(require("null-ls").builtins.code_actions.eslint_d.with {
            condition = function(utils) return utils.root_has_file "package.json" end,
          })
        end,
        -- For black:
        black = function() require("null-ls").register(require("null-ls").builtins.formatting.black) end,
        -- For flake8:
        flake8 = function() require("null-ls").register(require("null-ls").builtins.diagnostics.flake8) end,
        -- For terraform_fmt:
        terraform_fmt = function() require("null-ls").register(require("null-ls").builtins.formatting.terraform_fmt) end,
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      -- ensure_installed = { "python" },
    },
  },
}
