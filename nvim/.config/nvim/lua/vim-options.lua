vim.g.mapleader = " "
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- Enable line numbers globally
vim.opt.number = true

-- Create an autocmd group for toggling relative numbers
local numbertoggle_group = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- Set relative numbers when entering buffers or when focus is gained
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave", "WinEnter" },
  {
    pattern = "*",
    group = numbertoggle_group,
    callback = function()
      if vim.opt.number:get() and vim.api.nvim_get_mode().mode ~= "i" then
        vim.opt.relativenumber = true
      end
    end
  }
)

-- Disable relative numbers when leaving buffers or losing focus
vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter", "WinLeave" },
  {
    pattern = "*",
    group = numbertoggle_group,
    callback = function()
      if vim.opt.number:get() then
        vim.opt.relativenumber = false
      end
    end
  }
)
