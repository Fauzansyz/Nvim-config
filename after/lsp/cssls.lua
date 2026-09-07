-- settings for vscode-css-language-server
-- see https://github.com/hrsh7th/vscode-langservers-extracted
---@type vim.lsp.Config
return {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },
}
