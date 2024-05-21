require("oil").setup({
  default_file_explorer = false,

  columns = {
    "icon",
  },

  view_options = {
    show_hidden = true,
  }
})


vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<leader>de', "<CMD>Oil<CR>", { desc = '[D]irectory [E]dit' })
