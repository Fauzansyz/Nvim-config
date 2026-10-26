require("conform").setup {
  formatters_by_ft = {
    lua = { "stylua" },
    python = function(bufnr)
      if vim.fs.root(bufnr, { "uv.lock" }) and vim.fn.executable("uv") == 1 then
        return { "uv_black" }
      end
      return { "black" }
    end,
    javascript = { "prettier" },
    jsx = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    tsx = { "prettier" },
    typescriptreact = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    go = { "gofmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    sh = { "shfmt" },
    bash = { "shfmt" },
  },
  formatters = {
    uv_black = {
      command = "uv",
      args = { "run", "black", "--stdin-filename", "$FILENAME", "-" },
      stdin = true,
    },
  },
  format_on_save = {
    timeout_ms = 5000,
    lsp_format = "fallback",
  },
}
