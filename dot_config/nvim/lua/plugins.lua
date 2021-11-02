-- Author: Bevan Stanely
-- Website: https://bevs.xyz
-- Package Manager: packer.nvim
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Bootstrap Package Manager ==============================================================================================

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- ========================================================================================================================

-- Call all the required plugins ==========================================================================================

return require('packer').startup(function()
  -- Packer can manage itself
	use 'wbthomason/packer.nvim'
	
  -- Syntax highlighting
  use 'sheerun/vim-polyglot'

  -- Code completion
  use {'neoclide/coc.nvim', branch = 'release'}
  
  -- Asyncronous Lint Engine
  use {'dense-analysis/ale',cmd = 'ALEEnable',config = 'vim.cmd[[ALEEnable]]'}
	
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- ========================================================================================================================
