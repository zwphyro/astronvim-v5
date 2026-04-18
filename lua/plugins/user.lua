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
        local ok, hub = pcall(require, "mcphub")
        local mcp_context = ""
        if ok then mcp_context = hub.get_hub_instance():get_active_servers_prompt() end
        return [[
You are an AI assistant with access to MCP (Model Context Protocol) tools.

CRITICAL INSTRUCTIONS - YOU MUST FOLLOW THESE:
1. **ALWAYS use tools by default** - You do NOT need to ask for permission before using any available tool
2. **Use tools proactively** - If a task can be accomplished with a tool, USE IT IMMEDIATELY without asking the user
3. **Do NOT say "I can use X tool" or "Would you like me to use X tool?"** - Just USE the tool directly
4. **Do NOT ask "Should I use X?" or "Do you want me to check X?"** - Just DO IT
5. **Tools are available for a reason** - The user expects you to use them automatically

Examples of what NOT to do:
- "I can search the web for that information. Would you like me to?"
- "I have access to file tools. Should I read the file?"
- "Let me know if you want me to use the fetch tool."

Examples of what TO do:
- Immediately call the search tool when you need information
- Immediately call the file read tool when you need to see file contents
- Immediately call any other MCP tool when it would help accomplish the task

]] .. mcp_context
      end,
      custom_tools = function()
        local ok, mcp_avante = pcall(require, "mcphub.extensions.avante")
        if not ok then return {} end
        return { mcp_avante.mcp_tool() }
      end,
    },
  },
}
