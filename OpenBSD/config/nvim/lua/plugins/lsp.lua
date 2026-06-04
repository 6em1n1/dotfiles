-- Minimal LSP configuration for OpenBSD.
-- Servers must be installed manually and available in $PATH:
--   clangd       -> included in OpenBSD base (clang)
--   lua_ls       -> pkg_add lua-language-server (or build from source)
--   bashls       -> npm install -g bash-language-server
--   pylsp        -> pip install python-lsp-server
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {},
        lua_ls = {},
        bashls = {},
        pylsp = {},
      },
    },
  },
}
