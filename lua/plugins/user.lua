-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:

---@type LazySpec
return {

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

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
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = false,
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

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  },

  {
    "karb94/neoscroll.nvim",
    config = function() require("neoscroll").setup {} end,
  },

  {
    "shrynx/line-numbers.nvim",
    config = function()
      require("line-numbers").setup {
        enabled = true,
        mode = "both", -- Options: "relative", "absolute", "both", "none"
        format = "abs_rel", -- Shows absolute first, then relative ("rel_abs" also works)
      }
    end,
  },
}
