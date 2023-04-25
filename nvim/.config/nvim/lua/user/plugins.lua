local fn = vim.fn

-- Automatically install packer
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use 'nvim-lualine/lualine.nvim'
  use "akinsho/toggleterm.nvim"

  -- Colorschemes
  --[[ use "lunarvim/darkplus.nvim" ]]
  use "ellisonleao/gruvbox.nvim"
  use 'folke/tokyonight.nvim'
  --[[ use 'Mofiqul/dracula.nvim' ]]
  --[[ use 'sainnhe/everforest' ]]
  use({
    "catppuccin/nvim",
    as = "catppuccin"
  })

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "f3fora/cmp-spell"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use { 
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use 'p00f/nvim-ts-rainbow'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/playground'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "sindrets/diffview.nvim"

  -- easy motion
  --[[ use 'ggandor/leap.nvim' ]]
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
  }

  -- search
  use 'kevinhwang91/nvim-hlslens'
  use 't9md/vim-quickhl'
  -- indent
  use "lukas-reineke/indent-blankline.nvim"

  -- vim-illuminate
  use "RRethy/vim-illuminate"

  -- debug
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"
  use "nvim-telescope/telescope-dap.nvim"
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'

  -- dashboard-nvim
  use "glepnir/dashboard-nvim"

  -- nvim-scrollbar
  use "petertriho/nvim-scrollbar"

  use "folke/todo-comments.nvim"
  use 'mechatroner/rainbow_csv'
  use {
    'norcalli/nvim-colorizer.lua',
    config = function ()
        require'colorizer'.setup()
    end
  }
  use {
    'karb94/neoscroll.nvim',
    config = function ()
        require'neoscroll'.setup()
    end
  }
  use 'rcarriga/nvim-notify'
  -- orgmode
  use 'nvim-orgmode/orgmode'
  use "akinsho/org-bullets.nvim"

  use 'anuvyklack/pretty-fold.nvim'

  -- code outline
  use 'simrat39/symbols-outline.nvim'

  -- latex
  use 'lervag/vimtex'

  use "folke/neodev.nvim"
  
  use 'sunjon/shade.nvim'
  use 'folke/twilight.nvim'
  
  use 'ojroques/vim-oscyank'

  use 'lyokha/vim-xkbswitch'

  use {
      'numToStr/Navigator.nvim',
      config = function()
          require('Navigator').setup()
      end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
