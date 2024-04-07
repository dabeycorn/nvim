vim.g.mapleader = ' '

local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end

-- EDITOR BINDS 


-- VIM has no crutches
key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')

-- LSP Binds & Trouble Binds
vim.keymap.set('n', '<leader>ls', "<Cmd>LspStart<CR>")
vim.keymap.set('n', '<leader>lx', "<Cmd>LspStop<CR>")
vim.keymap.set('n', '<leader>li', "<Cmd>LspInfo<CR>")
vim.keymap.set('n', '<leader>ll', "<Cmd>LspLog<CR>")
vim.keymap.set('n', '<leader>lr', "<Cmd>LspRestart<CR>")

-- Trouble Binds
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xt", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

-- Telescope Binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fm', builtin.man_pages, {})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, {})
vim.keymap.set('n', '<leader>fs', builtin.spell_suggest, {})

-- nvim tree Binds
vim.keymap.set('n', '<leader>tt', "<Cmd>NvimTreeToggle<CR>", {silent = true})
vim.keymap.set('n', '<leader>tf', "<Cmd>NvimTreeFocus<CR>", {silent = true})
vim.keymap.set('n', '<leader>tc', "<Cmd>NvimTreeCollapse<CR>", {silent = true})
vim.keymap.set('n', '<leader>tl', "<Cmd>NvimTreeFindFile<CR>", {silent = true})

-- hlslens Binds
