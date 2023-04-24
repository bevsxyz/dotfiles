-- Author: Bevan Stanely
-- Website: https://bevs.xyz
-- Package Manager: packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap Package Manager ==============================================================================================
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

-- ========================================================================================================================

-- Call all the required plugins ==========================================================================================

return require('packer').startup(function()
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	
  -- Syntax highlighting
  use {'nvim-treesitter/nvim-treesitter' , run = ':TSUpdate'}

  -- Color theme
  use {'Mofiqul/dracula.nvim', as = 'dracula',
        config = vim.cmd.colorscheme('dracula')}

  -- Status bar
  use {'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        config = function() require('lualine').setup {
                options={
                        theme = 'dracula'
                }
        } end
  }
  
  -- Asyncronous Lint Engine
	
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- ========================================================================================================================
