return {
  {
    "junegunn/fzf",
    cmd = "FZF",
    config = function() require("fzf_lib").install() end,
  },
  {
    "github/copilot.vim",
    cmd = "Copilot",
    event = "BufRead",
    config = function()
      vim.b.copilot_enabled = true
      vim.g.copilot_no_tab_map = true

      local keymap = vim.keymap.set
      -- https://github.com/orgs/community/discussions/29817#discussioncomment-4217615
      keymap(
        "i",
        "<C-a>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, script = true, replace_keycodes = false }
      )
      keymap("i", "<C-]>", "<Plug>(copilot-next)")
      keymap("i", "<C-[>", "<Plug>(copilot-previous)")
      -- keymap("i", "<C-d>", "<Plug>(copilot-dismiss)")
      keymap("i", "<C-s>", "<Plug>(copilot-suggest)")
      
      -- Disable Copilot for large files
      vim.cmd([[
        autocmd BufReadPre * 
        lua if vim.fn.getfsize(vim.fn.expand("<afile>")) > 100000 or vim.fn.getfsize(vim.fn.expand("<afile>")) == -2 then vim.b.copilot_enabled = false end
      ]])
    end,
  },
  {
    "akinsho/flutter-tools.nvim",
    after = "mason-lspconfig.nvim", -- make sure to load after mason-lspconfig
    config = function()
      require("flutter-tools").setup {
        flutter_lookup_cmd = "asdf where flutter",
        lsp = {
          color = {
            enabled = true,
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
          },
        },
      }
    end,
  },
  -- {
  --   -- TODO: you should install chafa. See https://hpjansson.org/chafa/
  --   "nvim-telescope/telescope-media-files.nvim",
  --   after = "telescope.nvim",
  --   config = function()
  --     require("telescope").setup {
  --       extensions = {
  --         media_files = {
  --           -- filetypes whitelist
  --           -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
  --           filetypes = { "png", "webp", "jpg", "jpeg" },
  --           -- find command (defaults to `fd`)
  --           find_cmd = "rg",
  --         },
  --       },
  --     }
  --     require("telescope").load_extension "media_files"
  --     require("telescope").extensions.media_files.media_files()
  --   end,
  -- },

  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
