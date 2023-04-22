return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      null_ls.builtins.formatting.stylua,
      -- TODO: prettier will comflict with eslint_d, when typescript is used.
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,
      -- null_ls.builtins.formatting.eslint_d,
      null_ls.builtins.diagnostics.eslint_d,
      null_ls.builtins.diagnostics.flake8,
      null_ls.builtins.code_actions.eslint_d,
    }
    config.root_dir = require("null-ls.utils").root_pattern(
      ".null-ls-root",
      "Makefile",
      ".git",
      "package.json",
      "node_modules",
      ".eslintrc.js",
      ".eslintrc.json",
      ".prettierrc",
      ".prettierrc.js",
      ".prettierrc.json",
      ".stylua.toml",
      "stylua.toml",
      ".stylua.toml"
    )
    return config -- return final config table
  end,
}
