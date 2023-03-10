local fterm = require('FTerm')

-- Setup

fterm.setup({
  border = 'rounded',
  dimensions = {
    height = 0.8,
    width = 0.8,
    x = 0.5,
    y = 0.5,
  },
})

-- User commands

vim.api.nvim_create_user_command('FTermOpen', fterm.open, { bang = true })

-- This will close the terminal window but preserves the actual terminal session
vim.api.nvim_create_user_command('FTermClose', fterm.close, { bang = true })

-- Unlike closing, this will remove the terminal session
vim.api.nvim_create_user_command('FTermExit', fterm.exit, { bang = true })

vim.api.nvim_create_user_command('FTermToggle', fterm.toggle, { bang = true })

-- Keymaps

vim.keymap.set({ 'n', 'v', 't' }, "<C-t>", vim.cmd.FTermToggle)
vim.keymap.set('i', "<C-t>", [[<ESC>:FTermToggle<CR>]])

vim.keymap.set('t', "<ESC>", [[<C-\><C-n>]])
