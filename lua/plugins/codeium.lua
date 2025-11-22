return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,

        filetypes = {},
        default_filetype_enabled = true,

        idle_delay = 75,
        virtual_text_priority = 65535,

        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
          accept = false, -- Defined in blink.lua
          accept_word = "<C-k>",
          accept_line = "<C-l>",
          clear = "<C-x>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    }
  end,
}
