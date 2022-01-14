require'lualine'.setup{
  options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
  sections = {
    lualine_c = {
           {
          'filename',
          file_status = true,   -- displays file status (readonly status, modified status)
          path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40, -- Shortens path to leave 40 space in the window
                                -- for other components. Terrible name any suggestions?
          -- symbols = {
          --   modified = '[+]',      -- when the file was modified
          --   readonly = '[-]',      -- if the file is not modifiable or readonly
          --   unnamed = '[No Name]', -- default display name for unnamed buffers

          -- }
      } 
    }
  }
}
