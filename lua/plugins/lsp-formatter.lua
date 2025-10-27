return {
    {
        "mason-org/mason.nvim",
        opts = {},
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("mason").setup()
            vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", { desc = "Mason menu", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { desc = "(LSP) buffer rename", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { desc = "(LSP) Format current buffer", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "(LSP) show diagnostic", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "(LSP) next diagnostic", noremap = true, silent = true })
            vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "(LSP) previous diagnostic", noremap = true, silent = true })
        end
    },
    { "neovim/nvim-lspconfig" },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    },
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                php = { "easy-coding-standard" },
                rust = { "rustfmt" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                html = { "prettier" },
                css = { "prettier" },
                scss = { "prettier" },
            },
        },
        config = function(_, opts)
            local conform = require("conform")
            conform.setup(opts)
            vim.keymap.set("n", "<leader>cf", conform.format, { desc = "(LSP) (CONFORM) Format current buffer", noremap = true, silent = true })
        end
    },
    {
        "zapling/mason-conform.nvim",
        opts = {},
        dependencies = { "mason-org/mason.nvim", "stevearc/conform.nvim" },
        config = function()
            require("mason-conform").setup()
        end
    },
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            require("actions-preview").setup()
            vim.keymap.set("n", "<leader>la", require("actions-preview").code_actions, { desc = "(LSP) Show code actions", noremap = true, silent = true })
        end
    }
}
