return {
    {
        "mason-org/mason.nvim",
        opts = {},
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason menu", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "(LSP) buffer format", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "(LSP) buffer rename", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "(LSP) show diagnostic", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "(LSP) next diagnostic", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "(LSP) previous diagnostic", noremap = true, silent = true })
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
