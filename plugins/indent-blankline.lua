return {
  'lukas-reineke/indent-blankline.nvim',
  enabled = true,
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
