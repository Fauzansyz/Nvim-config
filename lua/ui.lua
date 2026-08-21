--- This module will load a random colorscheme on nvim startup process.
local utils = require("utils")

local M = {}

local use_theme = function(name)
  local ok, err = pcall(vim.cmd.colorscheme, name)

  if not ok then
    vim.notify(
      string.format("Failed to load colorscheme %s, err: %s", name, err),
      vim.log.levels.WARN
    )

    vim.cmd.colorscheme("default")
  end
end

-- Colorscheme to its directory name mapping, because colorscheme repo name is not necessarily
-- the same as the colorscheme name itself.
M.colorscheme_conf = {
  catppuccin = function()
    require("catppuccin").setup {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
    }
    use_theme("catppuccin")
  end,
}

-- Load the single colorscheme directly instead of randomly
M.colorscheme_conf.catppuccin()

-- enable the experiment UI
require("vim._core.ui2").enable {
  enable = true,
  msg = { -- Options related to the message module.
    targets = {
      [""] = "cmd",
      empty = "msg",
    },
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.2, -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.2, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.2, -- Maximum height.
      timeout = 1000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 0.3, -- Maximum height.
    },
  },
}

return M
