
-- lua/June/plugins/mason.lua
return {
  -- 1) mason.nvim itself
  {
    "williamboman/mason.nvim",
    lazy = false,            -- load at startup so it's in your rtp
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- 2) the mason‑lspconfig bridge — only run once mason & lspconfig are on your rtp
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",    -- must have mason in your runtimepath
      "neovim/nvim-lspconfig",      -- must have lspconfig in your runtimepath
    },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = false,
        ensure_installed = {
          "lua_ls",
          "html",
          "cssls",
          "tailwindcss",
          "gopls",
          "emmet_ls",
          "eslint",
          "marksman",
        },
      })
    end,
  },

  -- 3) mason-tool‑installer, which only needs mason.nvim
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "prettier",
          "stylua",
          "isort",
          "pylint",
          "clangd",
          "denols",
          { "eslint_d", version = "13.1.2" },
        },
      })
    end,
  },
}
