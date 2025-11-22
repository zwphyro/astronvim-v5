return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        function()
          if require("codeium.virtual_text").get_current_completion_item() then
            vim.api.nvim_input(require("codeium.virtual_text").accept())
            return true
          else
            return false
          end
        end,
        "select_next",
        "snippet_forward",
        "fallback",
      },
    },
  },
}
