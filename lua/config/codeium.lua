local codeium = require("codeium")

codeium.setup({
  enable_cmp_source = true,
  virtual_text = {
    enabled = true,
    manual = false,
    filetypes = {},
    default_filetype_enabled = true,
    idle_delay = 75,
    page_on_every_accept = false,
    key_bindings = {
      accept = "<C-g>", -- Accept full suggestion (Ctrl + g)
      accept_word = "<M-w>", -- Accept next word (Alt + w)
      accept_line = "<M-l>", -- Accept next line (Alt + l)
      clear = "<M-c>", -- Clear suggestion (Alt + c)
      next = "<M-]>", -- Next suggestion (Alt + ])
      prev = "<M-[>", -- Previous suggestion (Alt + [)
    },
  },
})

-- Keymaps in Normal mode to toggle Codeium or open chat
local keymap = vim.keymap

keymap.set("n", "<leader>ct", function()
  vim.cmd("Codeium Toggle")
end, { desc = "Toggle Codeium" })

keymap.set("n", "<leader>cc", function()
  vim.cmd("Codeium Chat")
end, { desc = "Codeium Chat" })
