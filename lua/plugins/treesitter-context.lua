return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            vim.keymap.set("n", "<leader>c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true, desc = "Go to Treesitter context" })

            vim.keymap.set("n", "<leader>tc", "<cmd>TSContext toggle<CR>", { desc = "Toggle Treesitter context" })
        end
    }
}
