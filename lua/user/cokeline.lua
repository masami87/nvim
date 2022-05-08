local get_hex = require('cokeline/utils').get_hex
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')


require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('Comment', 'fg')
    end,
    bg = get_hex('ColorColumn', 'bg'),
  },

  sidebar = {
    filetype = 'NvimTree',
    components = {
        {

          text = '  NvimTree',
            fg = get_hex('Keyword', 'fg'),
            bg = get_hex('NvimTreeNormal', 'bg'),
            style = 'bold'
        },
      },
  },

  components = {
    {
      text = ' ',
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      fg = function(buffer)
        return buffer.devicon.color
      end,
    },
    {
      text = function(buffer) return buffer.filename end,
      style = function(buffer)
        return buffer.is_focused and 'bold' or nil
      end,
    },
    {
      text = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
          or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
          or ''
      end,
      fg = function(buffer)
        return

          (buffer.diagnostics.errors ~= 0 and errors_fg)
          or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
          or nil

      end,
      truncation = { priority = 1 },
    },
    {
      text = ' ',
    },
    {
        text = function(buffer)
          return buffer.is_modified and '●' or ''
        end,
        fg = function(buffer)
          return buffer.is_modified or nil
        end,
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
    {
      text = '',
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'bg'),
    },
  },
})
