-- runs lua vim.lsp... with just :Format
vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
-- TODO : watch lsp of chrismachine
