local wk = require("which-key")
wk.register({
  n = {
    name = "Neorg",
    -- Journal today loads weird rely on manual loading for now
    -- j = { "<cmd>Neorg journal today<CR>", "Today" },
    h = { "<cmd>Neorg workspace home<CR>", "Set home workspace" },
    w = { "<cmd>Neorg workspace work<CR>", "Set work workspace" },
    t = {
      name = "Templates",
      h = {
        name = "Home",
        j = { "<cmd>Neorg templates fload hjournal<CR>", "Journal Template" },
        w = { "<cmd>Neorg templates fload hwine<CR>", "Wine Template" },
        b = { "<cmd>Neorg templates fload hbook<CR>", "Book Template" },
        m = { "<cmd>Neorg templates fload hmovie<CR>", "Movie Template" },
      },
    },
  },
}, { prefix = "<leader>" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "norg",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.list = false
  end,
})

return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  -- tag = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
        ["core.integrations.nvim-cmp"] = {},
        ["core.concealer"] = { config = { icon_preset = "diamond" } }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              work = "/Users/santiagomunevar/Library/Mobile Documents/com~apple~CloudDocs/neorg-notes/work",
              home = "/Users/santiagomunevar/Library/Mobile Documents/com~apple~CloudDocs/neorg-notes/home",
            },
          },
        },
        -- ["core.keybinds"] = {
        --   -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
        --   config = {
        --     default_keybinds = true,
        --     neorg_leader = "<Leader>n",
        --   },
        -- },
        ["external.templates"] = {
          config = {
            snippets_overwrite = {
              date_format = [[%Y/%m/%d]],
            },
          },
        },
      },
    })
  end,
}
