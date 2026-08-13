-- Minimal treesitter parsers for OpenBSD.
-- Only install languages we actively use + essentials for Neovim itself.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
      },
    },
  },
}
