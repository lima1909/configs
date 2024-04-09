return {
  -- show status from startign LSP server
  { 
    "j-hui/fidget.nvim",
    config = function ()
    	require("fidget").setup({})
    end
  },
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
    	ensure_installed = { "lua_ls", "rust_analyzer" },
	})
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function(ev)

    	local lspconfig = require("lspconfig")
	local capabilities = require('cmp_nvim_lsp').default_capabilities()

--	local on_attach = function(client)
--   		require'completion'.on_attach(client)
--	end

    	lspconfig.lua_ls.setup({
		capabilities = capabilities,
	})
    	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
--    		on_attach = on_attach,
--    		on_attach = function(client, bufnr)
--        		vim.lsp.inlay_hint.enable(bufnr)
--    		end,

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
