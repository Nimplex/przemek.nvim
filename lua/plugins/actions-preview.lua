return {
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            require("actions-preview").setup()
            vim.keymap.set("n", "<leader>la", require("actions-preview").code_actions, { desc = "(LSP) Show code actions", noremap = true, silent = true })
        end
    }
}
