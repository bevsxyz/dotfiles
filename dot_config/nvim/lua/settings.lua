local o = vim.o
local wo = vim.wo
local bo = vim.bo
local g = vim.g

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 

-- window-local options
wo.number = true
wo.wrap = false

-- buffer-local options
bo.expandtab = true

g['ale_disable_lsp'] = 1
g['ale_sign_column_always'] = 1
g['ale_fix_on_save'] = 1
g['ale_sign_error'] = '✗'
g['ale_sign_warning'] = ''
