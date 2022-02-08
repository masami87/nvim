local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local config = {
  options = {
		icons_enabled = true,
		theme = "ayu_dark",
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
		disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},

  sections = {
    lualine_c = {

           {

          'filename',
          color = { fg = colors.violet, gui = 'bold'},
          file_status = true,   -- displays file status (readonly status, modified status)
          path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40, -- Shortens path to leave 40 space in the window
                                -- for other components. Terrible name any suggestions?
          -- symbols = {
          --   modified = '[+]',      -- when the file was modified
          --   readonly = '[-]',      -- if the file is not modifiable or readonly
          --   unnamed = '[No Name]', -- default display name for unnamed buffers

          -- }
      },
    },
    lualine_x = {
      {
        -- Lsp server name .
        function()
          local msg = 'No Active Lsp'
          local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
          local clients = vim.lsp.get_active_clients()
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = ' LSP:',
        -- color = { fg = '#ffffff', gui = 'bold' },
      },
      'encoding', 'fileformat', 'filetype'
    }
  }
}

require'lualine'.setup(config)
