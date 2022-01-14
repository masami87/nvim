local fn = vim.fn

-- Automatically install packer
-- 如果没安装packer就安装一下
-- data: ~/.local/share/nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua fil
--vim.cmd [[
--  augroup packer_user_config
--    autocmd!
--    autocmd BufWritePost plugins.lua source <afile> | PackerSync
--  augroup end
--]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
-- floating window!!!
packer.init {

  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- colorscheme
  use 'folke/tokyonight.nvim'
  use 'shaeinst/roshnivim-cs'
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    -- tag = 'v0.1.0', -- Optional tag release
    -- config = function()
    --
    --     vim.cmd('colorscheme rose-pine')
    -- end
})

  use "goolord/alpha-nvim"

  use "kyazdani42/nvim-web-devicons"
  use 'nvim-lualine/lualine.nvim'

  use "kyazdani42/nvim-tree.lua"

  use "akinsho/bufferline.nvim"

  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "folke/todo-comments.nvim" -- highlight TODO comment

  -- terminal manager
  use "akinsho/toggleterm.nvim"

  -- smooth scrolling
  use "karb94/neoscroll.nvim"


  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua" -- 为了给vim.* 补全

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  -- 自动安装nvim-lsp-server
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "ray-x/lsp_signature.nvim" -- function signature hint

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",

    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"

  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- rust
  use "simrat39/rust-tools.nvim"

  -- debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- 
  -- if PACKER_BOOTSTRAP then
  --   require("packer").sync()
  -- end
end)
