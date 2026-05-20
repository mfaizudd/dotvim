-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'xiyaowong/transparent.nvim' },
  { 'Hoffs/omnisharp-extended-lsp.nvim' },
  { 'ThePrimeagen/harpoon' },
  { 'tpope/vim-abolish' },
  { 'sindrets/diffview.nvim' },
  { 'ojroques/vim-oscyank' },
  { 'farmergreg/vim-lastplace' },
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'nvim-orgmode/orgmode',
    event = 'VeryLazy',
    ft = { 'org' },
    config = function()
      -- Setup orgmode
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
  },
  { 'dhruvasagar/vim-table-mode' },
  { 'akinsho/org-bullets.nvim' },
  {
    'mrshmllow/orgmode-babel.nvim',
    dependencies = {
      'nvim-orgmode/orgmode',
      'nvim-treesitter/nvim-treesitter',
    },
    cmd = { 'OrgExecute', 'OrgTangle' },
    opts = {
      -- by default, none are enabled
      langs = { 'python', 'lua', ... },

      -- paths to emacs packages to additionally load
      load_paths = {},
    },
  },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { 'wakatime/vim-wakatime', lazy = false },
  { 'Decodetalkers/csharpls-extended-lsp.nvim' },
  {
    'seblyng/roslyn.nvim',
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    opts = {
      -- your configuration comes here; leave empty for default settings
      choose_target = function(target)
        return vim.iter(target):find(function(item)
          if string.match(item, 'PAC.sln') then
            return item
          end
        end)
      end,
    },
  },
}

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end
