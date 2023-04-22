-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    -- quick move
    ["<S-h>"] = { "0", desc = "Cursor to start" },
    ["<S-l>"] = { "$", desc = "Cursor to end" },

    -- limit
    ["<Left>"] = { "<Nop>" },
    ["<Down>"] = { "<Nop>" },
    ["<Up>"] = { "<Nop>" },
    ["<Right>"] = { "<Nop>" },

    -- buffer
    ["<A-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "To switch to the left buffer",
    },
    ["<A-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "To switch to the right buffer",
    },

    -- editor
    ["d"] = { '"_d' },
    ["dd"] = { '"_dd' },
    ["D"] = { '"_D' },
    ["x"] = { '"_x' },
    ["s"] = { '"_s' },

    ["<S-j>"] = { "viw", desc = "Word selection" },
  },
  i = {
    -- limit
    ["<Left>"] = { "<Nop>" },
    ["<Down>"] = { "<Nop>" },
    ["<Up>"] = { "<Nop>" },
    ["<Right>"] = { "<Nop>" },

    ["<C-h>"] = { "<Left>" },
    ["<C-j>"] = { "<Down>" },
    ["<C-k>"] = { "<Up>" },
    ["<C-l>"] = { "<Right>" },

    -- editor
    ["<C-v>"] = { "<C-><C-O>P", desc = "Paste" },
  },
  v = {
    -- editor
    ["d"] = { '"_d' },
    ["dd"] = { '"_dd' },
    ["D"] = { '"_D' },
    ["x"] = { '"_x' },
    ["s"] = { '"_s' },

    -- quick move
    ["<S-h>"] = { "0", desc = "Cursor to start" },
    ["<S-l>"] = { "$", desc = "Cursor to end" },

    -- move line
    ["J"] = { ":move '>+1<CR>gv-gv", desc = "Move lines of code up" },
    ["K"] = { ":move '<-2<CR>gv-gv", desc = "Move lines of code down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
