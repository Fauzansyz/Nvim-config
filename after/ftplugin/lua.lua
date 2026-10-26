-- Disable inserting comment leader after hitting o/O/<Enter>
vim.opt_local.formatoptions:remove { "o", "r" }

vim.keymap.set("n", "<F9>", "<cmd>luafile %<CR>", {
  buffer = true,
  silent = true,
})
