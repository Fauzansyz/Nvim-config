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
    local function fix_all()
      client.request_sync("workspace/executeCommand", {
        command = "eslint.applyAllFixes",
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, nil, bufnr)
    end

    -- Create a buffer-local command EslintFixAll
    vim.api.nvim_buf_create_user_command(bufnr, "EslintFixAll", fix_all, {
      desc = "Fix all eslint problems for this buffer",
    })

    -- Run auto-fix on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      callback = fix_all,
    })
  end,
}
