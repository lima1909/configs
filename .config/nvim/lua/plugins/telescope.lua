return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]ile' })
		vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffer' })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
		vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
	end
}
