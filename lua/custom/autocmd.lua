-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ocaml",
  callback = function()
    vim.schedule(function()
      local orig = vim.bo.indentexpr
      if orig ~= "" and not orig:find("v:lnum == 1") then
        vim.bo.indentexpr = ("(v:lnum == 1 ? 0 : (%s))"):format(orig)
      end
    end)
  end,
})
