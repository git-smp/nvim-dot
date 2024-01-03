-- Copilot disalbed by default
vim.g.copilot_enabled = 0
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.defer_fn(function()
      vim.cmd("Copilot disable")
    end, 100) -- Defer the disable command by 100ms to ensure it runs after the plugin is loaded
  end,
})

return {}
