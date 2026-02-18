local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")

dap_virtual_text.setup()

dap.adapters.gdb = {
    type = "executable",
    command = "gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.adapters.codelldb = {
    type = "executable",
    command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"

    -- On windows you may have to uncomment this:
    -- detached = false,
}

dap.configurations.c = {
    {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
    {
        name = "Launch with dynamic args",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        args = function()
            local args_str = vim.fn.input('Arguments: ')
            return vim.split(args_str, " +") -- Splits the string into a table by spaces
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

dap.configurations.cpp = dap.configurations.c

ui.setup()

-- vim.fn.sign_define("DapBreakpoint", { text = "🐞" })

dap.listeners.before.attach.dapui_config = function()
    ui.open()
end
dap.listeners.before.launch.dapui_config = function()
    ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    ui.close()
end

vim.keymap.set('n', '<leader>dt', '<cmd>lua require("dap").toggle_breakpoint()<cr>', {})
vim.keymap.set('n', '<leader>dc', '<cmd>lua require("dap").continue()<cr>', {})
vim.keymap.set('n', '<leader>di', '<cmd>lua require("dap").step_into()<cr>', {})
vim.keymap.set('n', '<leader>do', '<cmd>lua require("dap").step_over()<cr>', {})
vim.keymap.set('n', '<leader>du', '<cmd>lua require("dap").step_out()<cr>', {})
vim.keymap.set('n', '<leader>dq',
    '<cmd>lua require("dap").terminate() require("dapui").close() require("nvim-dap-virtual-text").toggle()<cr>', {})
