return {
  {
    "williamboman/mason.nvim",
    config = function()
	require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
	require("mason-lspconfig").setup({
    	ccensure_installed = { "lua_ls", "rust_analyzer" },
	})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function(ev)
    	local lspconfig = require("lspconfig")

	local on_attach = function(client)
    		require'completion'.on_attach(client)
	end

    	lspconfig.lua_ls.setup({})
    	lspconfig.rust_analyzer.setup({
    		on_attach = on_attach,
    		settings = {
        		["rust-analyzer"] = {
            		imports = {
                		granularity = {
                    			group = "module",
                		},
                		prefix = "self",
            		},
            		cargo = {
                		buildScripts = {
                    			enable = true,
                		},
            		},
            		procMacro = {
                		enable = true
            		},
        		}
    		}
	})

	local opts = { buffer = ev.buf }
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
	vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
    end
  }
}
