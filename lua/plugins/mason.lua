return {
    {
        "mason-org/mason.nvim",
        opts = {},
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Show Mason menu" })
            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "(LSP) Buffer format", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "(LSP) Buffer code actions", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "(LSP) Buffer rename", noremap = true, silent = true })

        end
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            -- I"m leaving this just in case
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
