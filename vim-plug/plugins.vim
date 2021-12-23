call plug#begin('~/.vim/plugged')

" git surpport
Plug 'lewis6991/gitsigns.nvim'

"telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"auto pairs
Plug 'windwp/nvim-autopairs'

" color
Plug 'norcalli/nvim-colorizer.lua'

" terminal manager
Plug 'akinsho/toggleterm.nvim'

" smooth scrolling
Plug 'karb94/neoscroll.nvim'

" treesitter for highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
" rainbow pairs
Plug 'p00f/nvim-ts-rainbow'

" comment
Plug 'numToStr/Comment.nvim'

Plug 'folke/todo-comments.nvim'

Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" statu line
Plug 'nvim-lualine/lualine.nvim'
" Plug 'vim-airline/vim-airline' 

" theme
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }


Plug 'kyazdani42/nvim-tree.lua'

" bufferline
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim'


call plug#end()


