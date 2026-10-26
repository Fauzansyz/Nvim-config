---@type vim.lsp.Config
return {
  flags = {
    debounce_text_changes = 150,
  },
  before_init = function(_, config)
    local util = require("lspconfig.util")
    local tsserver_path = util.get_typescript_server_path(config.root_dir)

    if tsserver_path == "" and vim.fn.executable("npm") == 1 then
      local npm_root = vim.fn.systemlist({ "npm", "root", "-g" })
      if vim.v.shell_error == 0 and npm_root[1] then
        tsserver_path = vim.fs.joinpath(npm_root[1], "typescript", "lib")
      end
    end

    if tsserver_path ~= "" then
      config.init_options = config.init_options or {}
      config.init_options.tsserver = config.init_options.tsserver or {}
      config.init_options.tsserver.path = tsserver_path
    end
  end,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      suggest = {
        completeFunctionCalls = true,
      },
    },
  },
}
