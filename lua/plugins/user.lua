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
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",
    config = function() require("mcphub").setup() end,
    extensions = {
      avante = {
        make_slash_commands = true,
      },
    },
  },

  {
    "yetone/avante.nvim",
    opts = {
      provider = "openrouter",
      providers = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          model = "moonshotai/kimi-k2.5",
          api_key_name = "OPENROUTER_API_KEY",
        },
      },
      behaviour = {
        auto_suggestions = false,
      },
      system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function() return require("mcphub.extensions.avante").mcp_tool() end,
    },
  },
}
