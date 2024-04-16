return {
	'ThePrimeagen/harpoon',

	config = function()
		require("telescope").load_extension('harpoon')

		vim.keymap.set('n', 'mm', require("harpoon.mark").add_file, { desc = '[MM]ark harpoon' })
		vim.keymap.set('n', 'mn', require("harpoon.ui").toggle_quick_menu, { desc = '[MN]show menu harpoon' })
		--		vim.keymap.set('n', 'mn', require("harpoon.ui").nav_next, { desc = '[H]arpoon [N]ext' })
		--		vim.keymap.set('n', 'mp', require("harpoon.ui").nav_prev, { desc = '[H]arpoon [P]prev' })
		--		vim.keymap.set('n', 'mt', ':Telescope harpoon marks <CR>', { desc = '[H]arpoon [T]telescope' })
	end
}
