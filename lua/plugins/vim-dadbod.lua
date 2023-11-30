local wk = require("which-key")
wk.register({
  sq = {
    name = "Dadbod",
    o = { "<cmd>DBUIToggle<CR>", "Toggle" },
    f = { "<cmd>DBUIFindBuffer<CR>", "Edit with instruction", mode = { "n", "v" } },
    r = { "<cmd>DBUIRenameBuffer<CR>", "Grammar Correction", mode = { "n", "v" } },
    l = { "<cmd>DBUILastQueryInfo<CR>", "Translate", mode = { "n", "v" } },
  },
}, { prefix = "<leader>" })

vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "sql",
--   },
--   command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
-- })

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = {
--     "sql",
--     "mysql",
--     "plsql",
--   },
--   callback = function()
--     vim.schedule(db_completion)
--   end,
-- })

return {}
