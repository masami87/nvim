-- nothing here for now

-- 还需安装ueberzug才能生效
require('telescope').load_extension('media_files')

require 'telescope'.setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "gif", "jpg", "jpeg" },
      -- find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
