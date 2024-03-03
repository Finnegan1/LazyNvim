

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

  --package manager
  use 'wbthomason/packer.nvim'


  --search through project ...
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.3',
    requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}},
    config = function()
      require("telescope").load_extension("harpoon")
    end
  }


  --colorscheme
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ "catppuccin/nvim", as = "catppuccin" })


  --code highlighting
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})


  --recreate / see changes in the file
  use { "mbbill/undotree" }


  --git support for : line
  use { "tpope/vim-fugitive" }


  --LSP Support, Autocompletion, Snippets
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      --- Uncomment these if you want to manage LSP servers from neovim
      --mason = lsp manager
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- LSP Support
      {'neovim/nvim-lspconfig'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
    }
  }
  -- suggestions based on the current buffer
  use {'hrsh7th/cmp-buffer'}
   --path autocompletion
  use {'hrsh7th/cmp-path'}

  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  --harpoon -> jump between files
  use {
    'ThePrimeagen/harpoon',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require("harpoon").setup({}) end
  }


  --bottom bar
  use {'vim-airline/vim-airline'}
  --bottom bar
  use {'vim-airline/vim-airline-themes'}

  --github copilot
  use {'github/copilot.vim'}


  --lines between indents
  use {
    "lukas-reineke/indent-blankline.nvim"
  }

  --Time Tracking with waka api
  use {
    'wakatime/vim-wakatime'
  }


  --prettier
  --use {
  --  'prettier/vim-prettier',
  --  run = 'yarn install --frozen-lockfile --production',
    --ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'graphql', 'markdown', 'vue', 'html'}
  --}




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end)
