vim.keymap.set('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = '[H]arpoon [H]ome' })
vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', { desc = '[H]arpoon [A]dd' })

-- map to harpoon 1
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>', { desc = '[H]arpoon 1' })

-- map to harpoon 2
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>', { desc = '[H]arpoon 2' })

-- map to harpoon 3
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>', { desc = '[H]arpoon 3' })

-- map to harpoon 4
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>', { desc = '[H]arpoon 4' })
