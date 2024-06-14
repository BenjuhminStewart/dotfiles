require("supermaven-nvim").setup({
  keymaps = {
    accept_suggestion = "<Tab>",
    clear_suggestion = "<C-]>",
    accept_word = "<C-j>",
  },
  color = {
    suggestion_color = "#4f4f4f",
    cterm = 244,
  },
  disable_inline_completion = false,
  disable_keymaps = false,

})
