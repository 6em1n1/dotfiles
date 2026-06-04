-- Lualine theme matching the Graphite-Green colorscheme.
-- Transparent middle section for Alacritty 0.85 opacity.
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { fg = "#000000", bg = "#4CAF50", gui = "bold" },
            b = { fg = "#E5E5E5", bg = "#2D2D2D" },
            c = { fg = "#6C6C6C", bg = "NONE" },
          },
          insert = {
            a = { fg = "#000000", bg = "#00CDCD", gui = "bold" },
            b = { fg = "#E5E5E5", bg = "#2D2D2D" },
            c = { fg = "#6C6C6C", bg = "NONE" },
          },
          visual = {
            a = { fg = "#000000", bg = "#CD00CD", gui = "bold" },
            b = { fg = "#E5E5E5", bg = "#2D2D2D" },
            c = { fg = "#6C6C6C", bg = "NONE" },
          },
          replace = {
            a = { fg = "#000000", bg = "#CD0000", gui = "bold" },
            b = { fg = "#E5E5E5", bg = "#2D2D2D" },
            c = { fg = "#6C6C6C", bg = "NONE" },
          },
          command = {
            a = { fg = "#000000", bg = "#CDCD00", gui = "bold" },
            b = { fg = "#E5E5E5", bg = "#2D2D2D" },
            c = { fg = "#6C6C6C", bg = "NONE" },
          },
          inactive = {
            a = { fg = "#6C6C6C", bg = "#1A1A1A" },
            b = { fg = "#6C6C6C", bg = "#1A1A1A" },
            c = { fg = "#4D4D4D", bg = "NONE" },
          },
        },
      },
    },
  },
}
