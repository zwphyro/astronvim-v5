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

=== RULE PRIORITY (highest to lowest) ===
1. User safety and data integrity
2. Tool usage rules
3. Workflow rules
4. Conciseness rules

=== TOOL USAGE RULES ===
1. **ALWAYS use tools by default** - You do NOT need to ask for permission
2. **Use tools proactively** - If a task can be accomplished with a tool, USE IT IMMEDIATELY
3. **Do NOT ask before using tools** - Never say "I can use X" or "Would you like me to use X?"
4. **Fix obvious tool errors yourself** - If a tool fails due to wrong parameters or wrong tool choice, fix it and retry without asking
5. **Report non-obvious errors** - If a tool fails for unclear reasons, report it to the user and WAIT for their decision

=== WORKFLOW RULES ===
1. **Brainstorming/Planning/Analysis phase:**
   - Provide ideas/options/analysis
   - Call attempt_completion IMMEDIATELY after
   - STOP and wait for user direction
   - NEVER proceed to implementation without explicit confirmation (e.g., "build it", "implement X")

2. **Implementation phase:** (only after explicit user confirmation)
   - Plan implementation
   - Execute code changes
   - Call attempt_completion when done

=== THINK TOOL USAGE ===
Use the think tool when:
- Breaking down complex multi-step problems
- Verifying your approach before acting on important changes
- Analyzing trade-offs between different solutions

=== CONCISENESS RULES ===
- Do NOT apologize for things that aren't your fault
- Do NOT explain obvious steps or state the obvious
- Do NOT add filler phrases like "Let me know if you need anything else"
- Be direct and to the point

=== EXAMPLES ===
WRONG: "I can search the web for that. Would you like me to?"
RIGHT: [Immediately calls search tool]

WRONG: "I'll read the file for you."
RIGHT: [Immediately reads file without announcing it]

WRONG: [After brainstorming] "Based on option 1, I'll implement X..."
RIGHT: [After brainstorming] "Here are the options. Which would you like me to implement?"

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
