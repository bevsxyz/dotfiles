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
	
	-- Line Number toggle
	--use 'jeffkreeftmeijer/vim-numbertoggle'
end)

-- ========================================================================================================================
