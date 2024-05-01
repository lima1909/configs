return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    lazy = false,

    config = function()
        vim.g.rustaceanvim = {
            -- Plugin configuration
            tools = {
                -- test_executor = "background",
            },
            -- LSP configuration
            server = {
                default_settings = {
                    -- rust-analyzer language server configuration
                    ["rust-analyzer"] = {
                        imports = {
                            granularity = {
                                group = "module",
                            },
                            prefix = "self",
                        },
                        cargo = {
                            allFeatures = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        -- Add clippy lints for Rust.
                        checkOnSave = {
                            allFeatures = true,
                            command = "clippy",
                            extraArgs = { "--no-deps" },
                        },
                        procMacro = {
                            enable = true,
                            ignored = {
                                ["async-trait"] = { "async_trait" },
                                ["napi-derive"] = { "napi" },
                                ["async-recursion"] = { "async_recursion" },
                            },
                        },
                    },
                },
            },
            -- DAP configuration
            dap = {},
        }

        -- Run tests
        vim.keymap.set({ "n", "v" }, "<leader>rc", ":w | RustLsp run<CR>", { desc = "[R]un [C]urrent test" })
        vim.keymap.set({ "n", "v" }, "<leader>rt", ":w | RustLsp! testables<CR>", { desc = "[R]un:  all [T]ests" })

        -- add semicolon on the encoding
        vim.keymap.set({ "i", "n" }, ";", "<Esc>A;", { desc = "insert a semiconlon at the end of the line" })
    end,
}
