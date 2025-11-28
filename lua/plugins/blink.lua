return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = {
        function()
          local ok, vtext = pcall(require, "codeium.virtual_text")
          if ok and vtext.get_current_completion_item() then
            vim.api.nvim_input(vtext.accept())
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
