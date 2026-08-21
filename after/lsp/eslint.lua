---@type vim.lsp.Config
return {
  flags = {
    debounce_text_changes = 150,
  },
  settings = {
    workingDirectories = { mode = "auto" },
    format = true,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
}
