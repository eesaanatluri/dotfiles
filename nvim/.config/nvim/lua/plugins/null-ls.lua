return {
 "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.black,
            null_ls.builtins.formatting.isort,
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.completion.spell,
            null_ls.builtins.diagnostics.flake8,
            null_ls.builtins.diagnostics.yamllint,
            null_ls.builtins.diagnostics.ansiblelint,
            null_ls.builtins.diagnostics.commitlint,
            null_ls.builtins.diagnostics.gitleaks,
        },
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end
}
