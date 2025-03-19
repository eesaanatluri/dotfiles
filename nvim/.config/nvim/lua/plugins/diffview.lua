return {
  "sindrets/diffview.nvim",
  dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
  config = function()
    require("diffview").setup()
  end,
  keys = {
      {
        "<leader>dv",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
        desc = "Toggle Diffview window",
      },
    },
}
