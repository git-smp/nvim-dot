local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    -- Configure LazyVim to load gruvbox
    { "LazyVim/LazyVim", import = "lazyvim.plugins", opts = {
      colorscheme = "gruvbox",
    } },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    -- Install other plugins
    { "ellisonleao/gruvbox.nvim" },
    -- SQL stuff
    { "tpope/vim-dadbod" },
    { "kristijanhusak/vim-dadbod-ui" },
    -- Commenting out as potential nvim-cmp conflict
    -- { "kristijanhusak/vim-dadbod-completion" },
    -- Install neorg
    -- {
    --   "nvim-neorg/neorg",
    --   run = ":Neorg sync-parsers",
    -- },
    {
      "pwntester/octo.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("octo").setup({ enable_builtin = true })
        vim.cmd([[hi OctoEditable guibg=none]])
      end,
      keys = {
        { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
      },
    },
    -- {
    --   "epwalsh/obsidian.nvim",
    --   lazy = false,
    --   event = {
    --     "BufReadPre "
    --       .. vim.fn.expand("~")
    --       .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Santis Vault/**.md",
    --     "BufNewFile "
    --       .. vim.fn.expand("~")
    --       .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Santis Vault/**.md",
    --   },
    --   dependencies = {
    --     -- Required.
    --     "nvim-lua/plenary.nvim",
    --   },
    --   opts = {
    --     dir = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Santis Vault/",
    --     workspaces = {
    --       {
    --         name = "personal",
    --         path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Santis Vault/",
    --       },
    --     },
    --     daily_notes = {
    --       -- Optional, if you keep daily notes in a separate directory.
    --       folder = "Notes/Daily",
    --       -- Optional, if you want to change the date format for daily notes.
    --       date_format = "%Y-%m-%d",
    --       -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    --       template = "Daily Notes Template.md",
    --     },
    --     templates = {
    --       subdir = "Templates",
    --       date_format = "%Y-%m-%d-%a",
    --       time_format = "%H:%M",
    --     },
    --     -- Optional, set to true if you use the Obsidian Advanced URI plugin.
    --     -- https://github.com/Vinzent03/obsidian-advanced-uri
    --     use_advanced_uri = true,
    --   },
    -- },
    {
      "jackMort/ChatGPT.nvim",
      event = "VeryLazy",
      config = function()
        require("chatgpt").setup({
          openai_params = {
            model = "gpt-4-1106-preview",
            frequency_penalty = 0,
            presence_penalty = 0,
            max_tokens = 2000,
            temperature = 0,
            top_p = 1,
            n = 1,
          },
        })
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      },
    },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
