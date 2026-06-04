-- Mason does not support *BSD systems (see mason-org/mason.nvim#382).
-- LSP servers, formatters and linters must be installed manually on OpenBSD
-- and be available in $PATH.
return {
  { "williamboman/mason.nvim", enabled = false },
  { "williamboman/mason-lspconfig.nvim", enabled = false },
}
