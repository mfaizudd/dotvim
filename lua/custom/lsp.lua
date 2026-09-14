-- VUE LSP
local vue_language_server_path = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'
local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
  name = '@vue/typescript-plugin',
  location = vue_language_server_path,
  languages = { 'vue' },
  configNamespace = 'typescript',
}

local ts_ls_config = {
  init_options = {
    plugins = {
      vue_plugin,
    },
  },
  filetypes = tsserver_filetypes,
}

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {}

-- nvim 0.11 or above
vim.lsp.config('vue_ls', vue_ls_config)
vim.lsp.config('ts_ls', ts_ls_config)
vim.diagnostic.config {
  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines
}
-- vim.lsp.enable { 'ts_ls', 'vue_ls' } -- If using `ts_ls` replace `vtsls` to `ts_ls`

-- OCaml
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.onTypeFormatting = nil

vim.lsp.config['ocamllsp'] = {
  cmd = { 'ocamllsp' },
  filetypes = {
    'ocaml',
    'ocaml.interface',
    'ocaml.menhir',
    'ocaml.ocamllex',
    'dune',
    'reason',
  },
  root_markers = {
    { 'dune-project', 'dune-workspace' },
    { '*.opam', 'esy.json', 'package.json' },
    '.git',
  },
  settings = {},
  capabilities = capabilities,
}

-- Laravel
vim.lsp.config('laravel_lsp', {
  cmd = { 'laravel-lsp' },
  filetypes = { 'php', 'blade' },
  root_dir = function(bufnr, on_dir)
    local root = vim.fs.root(bufnr, 'artisan')

    if root then on_dir(root) end
  end,
})

vim.lsp.enable 'laravel_lsp'
