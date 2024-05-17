return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui", -- ui
        "leoluz/nvim-dap-go", -- go
        "theHamsta/nvim-dap-virtual-text", -- mark the current line
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
        })

        require("dapui").setup()
        require("nvim-dap-virtual-text").setup({
            enabled = true,
            -- enabled_commands = true,
            commented = true,
            -- all_references = true,
            highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
            highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
            show_stop_reason = true,
            -- virt_lines = true,
        })

        dap.listeners.before.attach.dapui_config = function()
            vim.keymap.set("n", "o", dap.step_over)
            vim.keymap.set("n", "i", dap.step_into)

            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            vim.keymap.set("n", "o", dap.step_over)
            vim.keymap.set("n", "i", dap.step_into)

            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            vim.keymap.del("n", "o")
            vim.keymap.del("n", "i")

            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- NOTE:
        -- https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt (row 522)

        vim.keymap.set("n", "<leader>dd", dap.continue, { desc = "[D]ebug [D]ebug run | continue" })
        vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "[D]ebug run [L]ast" })
        vim.keymap.set("n", "<leader>ds", dap.terminate, { desc = "[D]ebug [S]top | terminate" })

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
        vim.keymap.set("n", "<leader>dc", function()
            local input = vim.fn.input("Breakpoint condition: ")
            require("dap").set_breakpoint(input)
        end, { desc = "[D]ebug [C]ondition breakpoint" })

        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug step [Into]" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug step [O]ver" })
        vim.keymap.set("n", "<leader>du", dap.step_out, { desc = "[D]ebug step O[u]t" })
        vim.keymap.set("n", "<leader>d?", function()
            require("dapui").eval()
        end, { desc = "[D]ebug  [?] eval" })

        vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
            require("dap.ui.widgets").hover()
        end)

        vim.fn.sign_define("DapBreakpoint", { text = "🔴" })
        vim.fn.sign_define("DapBreakpointCondition", { text = "🔴" })
        vim.fn.sign_define(
            "DapLogPoint",
            { text = "", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "DapLogPoint" }
        )
        -- vim.fn.sign_define("DapStopped", { text = "", texthl = "", linehl = "", numhl = "" })
    end,
}
