-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`

vim.keymap.set("n", "<leader>e", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })


-- find and get prompt buffer
TP = function()
  local prompt_buf = vim.tbl_filter(function(b)
    return vim.bo[b].filetype == "TelescopePrompt"
  end, vim.api.nvim_list_bufs())[1]
  return TelescopeGlobalState[prompt_buf].picker
end

vim.cmd([[
  highlight TelescopePromptNormal guifg=#F1F1F1 guibg=#434343
  highlight TelescopePromptBorder guifg=#434343 guibg=#434343
  highlight TelescopePromptTitle  guifg=#434343 guibg=#89D3CD
  highlight TelescopePreviewNormal guifg=#F1F1F1 guibg=#393939
  highlight TelescopePreviewBorder guifg=#393939 guibg=#393939
  highlight TelescopeResultsNormal guifg=#F1F1F1 guibg=#323232
  highlight TelescopeResultsBorder guifg=#323232 guibg=#323232
]])

require('telescope').setup {
  preview_cutoff = 1,

  extensions = {
    file_browser = {
      grouped = true,
      initial_browser = "tree",
      initial_mode = "insert",
      auto_depth = true,
      depth = 1,
      hijack_netrw = true,
    },
  },
  defaults = {
    file_ignore_patterns = { ".git/", "node_modules/", "vendor/" },
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
    },
    borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
    theme = "center",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.5,
        border_hl = "TelescopePromptBorder",
        preview_cutoff = 100,
      },
    },
    pickers = {
      colorscheme = {
        enable_preview = true
      },
    },
    border_hl = '#ffffff',
    prompt_prefix = "  ",
    sorting_strategy = "ascending",
    cache_picker = {
      num_pickers = 20,
    },
    dynamic_preview_title = true,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = {
        ['<C-]>'] = require("telescope.actions.layout").toggle_preview
      }
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require("telescope").load_extension, "file_browser")


-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
-- hidden file find_file
vim.keymap.set('n', '<leader>ff', function()
  require('telescope.builtin').find_files({
    hidden = true,
  })
end, { desc = '[F]earch [F]iles' })
