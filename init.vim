source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
set termguicolors

" theme
source $HOME/.config/nvim/theme/tokyonight.vim
" source $HOME/.config/nvim/theme/nord.vim

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone

" Avoid showing extra messages when using completion
set shortmess+=c

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
 snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,

  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    -- <CR> -> 回车
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" config Comment.nvim
lua require('Comment').setup()

" Configure LSP through rust-tools.nvim plugin.

" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration

lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {

            show_parameter_hints = true,
            parameter_hints_prefix = ":",
            -- other_hints_prefix = "",

        },
    },


    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:

            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save

                checkOnSave = {
                    -- enable clippy
                   command = "clippy"

                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" clangd
lua << EOF
require'lspconfig'.clangd.setup{}
EOF

" nvim-treesitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"cpp", "rust", "vim", "lua", "bash", "cmake", "go"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "javascript" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {

    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    colors = {
        "#bf616a",
        "#458588",
        "#d65d0e",
        "#a89984",
        "#b48286",
        "#d79921",
        "#689d6a",
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
EOF

lua << EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`

 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }

 };
 -- globally enable default icons (default to false)

 -- will get overriden by `get_icons` option

 default = true;
}
EOF

lua << EOF
require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        -- 左侧让出 nvim-tree 的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        numbers = function(opts)
            return string.format('%s·%s', opts.raise(opts.id), opts.lower(opts.ordinal))
        end,
    }
}
EOF

lua << EOF
require'nvim-tree'.setup{
    update_cwd = true,
    view = {
        auto_resize = true,
    },
   }
EOF

lua << EOF
require'lualine'.setup{
  options = {
    -- ... your lualine config
    theme = 'auto'
    -- ... your lualine config
  }
}
EOF

lua << EOF
require('neoscroll').setup{
  mappings = {'<C-u>', '<C-d>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
}
EOF

lua << EOF
require("toggleterm").setup{
  -- 用这个快捷键打开和隐藏terminal, 如果要退出终端可以用终端的指定，比如输入exit
  -- 或者在TERMINAL模式下按<C-d>
  -- 同时TERMINAL模式下设置了快捷键<ESC>替代<C-\><C-n>回到NORMAL
  open_mapping = [[<c-\>]],
}
EOF

lua require'colorizer'.setup()
lua require('nvim-autopairs').setup{}
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- TODO:
    -- HACK:
    -- FIXME:
    -- WARNING:
    -- PERF:
    -- NOTE:
    signs = true, -- show icons in the signs column
  }
EOF

lua require('gitsigns').setup()

lua require "lsp_signature".setup()
