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

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_win_position = "left"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1

    vim.g.db_ui_save_location = vim.fn.stdpath("config") .. require("plenary.path").path.sep .. "db_ui"
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_tmp_query_location = "~/code/queries"

    local cmp = require("cmp")

    local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "sql", "mysql", "plsql" },
      callback = function()
        cmp.setup.buffer({
          sources = {
            { name = "vim-dadbod-completion" },
            { name = "buffer" },
            { name = "vsnip" },
          },
        })
      end,
      group = autocomplete_group,
    })
  end,
}
-- local function add_vim_dadbod_completion()
--   -- Get the current buffer's completion configuration
--   local current_buffer_cmp_config = require("cmp").get_config().sources or {}
--   -- Check if 'vim-dadbod-completion' is already in the sources
--   print("Before adding 'vim-dadbod-completion':")
--   for i, source in ipairs(current_buffer_cmp_config) do
--     print(i, source.name)
--   end
--   local found = false
--   for _, source in ipairs(current_buffer_cmp_config) do
--     if source.name == "vim-dadbod-completion" then
--       found = true
--       break
--     end
--   end
--   -- If 'vim-dadbod-completion' is not found, add it to the sources
--   if not found then
--     table.insert(current_buffer_cmp_config, { name = "vim-dadbod-completion" })
--   end
--   print("After adding 'vim-dadbod-completion':")
--   for i, source in ipairs(current_buffer_cmp_config) do
--     print(i, source.name)
--   end
--   -- Set the updated sources for the current buffer
--   require("cmp").setup.buffer({ sources = current_buffer_cmp_config })
-- end
-- -- Create an autocommand for the specified file types
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "sql", "mysql", "plsql" },
--   callback = add_vim_dadbod_completion,
-- })

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
