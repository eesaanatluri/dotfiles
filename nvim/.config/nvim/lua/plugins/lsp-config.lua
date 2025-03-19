return{
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
	  },
  },
  {
    "neovim/nvim-lspconfig",
	config = function()
  -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
	  local lspconfig = require('lspconfig')

  -- Configure LSP to use nvim-cmp as a completion engine
	  lspconfig.lua_ls.setup({
        capabilities = capabilities, -- Add other lspconfig configs if needed
      })
	  lspconfig.clangd.setup({
        capabilities = capabilities, -- Add other lspconfig configs if needed
      })
	  lspconfig.yamlls.setup({
        capabilities = capabilities, -- Add other lspconfig configs if needed
      })
	  lspconfig.sourcery.setup({
        capabilities = capabilities, -- Add other lspconfig configs if needed
      })
	  lspconfig.gopls.setup({
        capabilities = capabilities, -- Add other lspconfig configs if needed
      })

  -- Key mapping
	  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
	  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
	  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, {})
	end
  }
}
