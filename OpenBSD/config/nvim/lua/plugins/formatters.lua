-- Formatter configuration for OpenBSD.
-- Formatters must be installed manually and available in $PATH:
--   stylua        -> cargo install stylua (or build from source)
--   black         -> pip install black
--   shfmt         -> pkg_add shfmt (or go install mvdan.cc/sh/v3/cmd/shfmt@latest)
--   clang-format  -> included in OpenBSD base (clang)
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        sh = { "shfmt" },
        bash = { "shfmt" },
        c = { "clang_format" },
      },
    },
  },
}
