local get_hex = require('cokeline/utils').get_hex
local errors_fg = get_hex('DiagnosticError', 'fg')
local warnings_fg = get_hex('DiagnosticWarn', 'fg')

require('cokeline').setup({
  default_hl = {
    focused = {
      fg = get_hex('Normal', 'fg'),
      bg = get_hex('ColorColumn', 'bg'),
    },
    unfocused = {
      fg = get_hex('Comment', 'fg'),
      bg = get_hex('ColorColumn', 'bg'),
    },
  },

  rendering = {
    left_sidebar = {
      filetype = 'NvimTree',
      components = {
        {
          text = '  NvimTree',
          hl = {
            fg = get_hex('Normal', 'fg'),
            bg = get_hex('NvimTreeNormal', 'bg'),
            style = 'bold'
          }
        },
      }
    },
  },

  components = {
    {
      text = ' ',
      hl = {
        bg = get_hex('Normal', 'bg'),
      },
    },
    {
      text = '',
      hl = {
        fg = get_hex('ColorColumn', 'bg'),
        bg = get_hex('Normal', 'bg'),
      },
    },
    {
      text = function(buffer)
        return buffer.devicon.icon
      end,
      hl = {
        fg = function(buffer)
          return buffer.devicon.color
        end,
      },
    },
    {
      text = function(buffer) return buffer.filename end,
      hl = {
        style = function(buffer)
          return buffer.is_focused and 'bold' or nil
        end,
      }
    },
    {
      text = function(buffer)
        return
          (buffer.diagnostics.errors ~= 0 and '  ' .. buffer.diagnostics.errors)
          or (buffer.diagnostics.warnings ~= 0 and '  ' .. buffer.diagnostics.warnings)
          or ''
      end,
      hl = {
        fg = function(buffer)
          return

            (buffer.diagnostics.errors ~= 0 and errors_fg)
            or (buffer.diagnostics.warnings ~= 0 and warnings_fg)
            or nil

        end,
      },
      truncation = { priority = 1 },
    },
    {
      text = ' ',
    },
    {
        text = function(buffer)
          return buffer.is_modified and '●' or ''
        end,
        hl = {
          fg = function(buffer)
            return buffer.is_modified or nil
          end
        },
        delete_buffer_on_left_click = true,
        truncation = { priority = 1 },
    },
    {
      text = '',
      hl = {
        fg = get_hex('ColorColumn', 'bg'),
        bg = get_hex('Normal', 'bg'),
      },
    },
  },
})
