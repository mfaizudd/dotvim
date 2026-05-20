-- Install plugins via vim.pack
vim.pack.add {
  { src = 'https://github.com/xiyaowong/transparent.nvim' },
  { src = 'https://github.com/Hoffs/omnisharp-extended-lsp.nvim' },
  { src = 'https://github.com/ThePrimeagen/harpoon' },
  { src = 'https://github.com/tpope/vim-abolish' },
  { src = 'https://github.com/sindrets/diffview.nvim' },
  { src = 'https://github.com/ojroques/vim-oscyank' },
  { src = 'https://github.com/farmergreg/vim-lastplace' },
  { src = 'https://github.com/kdheepak/lazygit.nvim' },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-orgmode/orgmode' },
  { src = 'https://github.com/dhruvasagar/vim-table-mode' },
  { src = 'https://github.com/akinsho/org-bullets.nvim' },
  { src = 'https://github.com/mrshmllow/orgmode-babel.nvim' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
  { src = 'https://github.com/wakatime/vim-wakatime' },
  { src = 'https://github.com/Decodetalkers/csharpls-extended-lsp.nvim' },
  { src = 'https://github.com/seblyng/roslyn.nvim' },
}

-- lazygit.nvim keymap
vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>', { desc = 'LazyGit' })

-- orgmode setup
require('orgmode').setup {
  org_agenda_files = '~/orgfiles/**/*',
  org_default_notes_file = '~/orgfiles/refile.org',
}

-- NOTE: If you are using nvim-treesitter with `ensure_installed = "all"` option
-- add `org` to ignore_install

-- orgmode-babel setup
require('orgmode-babel').setup {
  -- by default, none are enabled
  langs = { 'python', 'lua' },
  -- paths to emacs packages to additionally load
  load_paths = {},
}

-- roslyn.nvim setup
require('roslyn').setup {
  choose_target = function(target)
    return vim.iter(target):find(function(item)
      if string.match(item, 'PAC.sln') then
        return item
      end
    end)
  end,
}
