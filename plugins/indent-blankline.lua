return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = false,
  opts = {
    filetype_exclude = {
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "typescript",
      "",
    },
    char = "┊", 
    space_char_blankline = " ",
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    -- disable = function(lang, buf)
    --   local max_filesize = 100 * 1024 -- 100 KB
    --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --   if ok and stats and stats.size > max_filesize then return true end
    -- end,

    -- highlight = {
    --   disable = function(lang, bufnr)
    --     local disabled = vim.api.nvim_buf_line_count(bufnr) > 7000;
			 --  if disabled then 
		  --     print("Highlighting" .. " is disabled in this buffer.")
	   --    end
		  --     return disabled
		  -- end,
    -- }
  }
}
