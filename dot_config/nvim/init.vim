" Author: Bevan Stanely
" Website: https://bevs.xyz/

lua require('settings')
lua require('plugins')
lua require('maps')
lua require('statusline.line')

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
