return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui", -- ui
        "leoluz/nvim-dap-go", -- go
    },

    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        require("dapui").setup()

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[D]ebug [B]reakpoint" })
        -- vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "[D]ebug [R]un" })
        vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "[D]ebug [R]un" })

        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "[D]ebug step [Into]" })
        vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug step [O]ver" })
    end,
}
