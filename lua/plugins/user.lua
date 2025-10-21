---@type LazySpec
return {

  "andweeb/presence.nvim",

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = table.concat({
            "    ████  ████      ",
            "      ████  ████    ",
            "    ████      ████  ",
            "    ██  ██  ██  ██  ",
            "    ██  ██  ██  ██  ",
            "  ██████      ████  ",
            "████████████████    ",
            "    ██████████  ██  ",
            "        ████  ████  ",
            "      ████          ",
          }, "\n"),
        },
      },
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup {
        filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      }
    end,
  },

  {
    "sainnhe/sonokai",
    config = function()
      vim.g.sonokai_enable_italic = true
      vim.g.sonokai_style = "andromeda" -- default | atlantis | andromeda | shusia | maia | espresso
    end,
  },
}
