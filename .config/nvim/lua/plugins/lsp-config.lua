return {
    {
        -- show status from startign LSP server
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup({})
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "gopls",
                },
            })

            local mason_tool_installer = require("mason-tool-installer")
            mason_tool_installer.setup({
                ensure_installed = {
                    "stylua", -- lua formatter
                    "golangci-lint",
                    "misspell",
                    "codelldb",
                    "delve",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function(ev)
            local lspconfig = require("lspconfig")
            -- local util = require("lspconfig/util")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            -- Find references for the word under your cursor.
            vim.keymap.set(
                "n",
                "cr",
                require("telescope.builtin").lsp_references,
                { desc = "[C]ode [R]eferences", buffer = ev.buf }
            )
            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            vim.keymap.set(
                "n",
                "ci",
                require("telescope.builtin").lsp_implementations,
                { desc = "[C]ode [I]mplementation", buffer = ev.buf }
            )
            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            vim.keymap.set(
                "n",
                "cd",
                require("telescope.builtin").lsp_type_definitions,
                { desc = "[C]ode [D]efinition", buffer = ev.buf }
            )
            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            vim.keymap.set("n", "rr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename", buffer = ev.buf })
        end,
    },
}
