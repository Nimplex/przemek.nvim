return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            -- https://github.com/nvim-telescope/telescope.nvim/issues/3020
            -- BACKDROP AUTOCMD
            local blend = 50
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopePrompt",
                callback = function(ctx)
                    local backdropName = "TelescopeBackdrop"
                    local telescopeBufnr = ctx.buf
                    local telescopeZindex = 50

                    local backdropBufnr = vim.api.nvim_create_buf(false, true)
                    local winnr = vim.api.nvim_open_win(backdropBufnr, false, {
                        relative = "editor",
                        border = "none",
                        row = 0,
                        col = 0,
                        width = vim.o.columns,
                        height = vim.o.lines,
                        focusable = false,
                        style = "minimal",
                        zindex = telescopeZindex - 1,
                    })

                    vim.api.nvim_set_hl(0, backdropName, { bg = "#000000", default = true })
                    vim.wo[winnr].winhighlight = "Normal:" .. backdropName
                    vim.wo[winnr].winblend = blend
                    vim.bo[backdropBufnr].buftype = "nofile"

                    vim.api.nvim_create_autocmd({ "WinClosed", "BufLeave" }, {
                        once = true,
                        buffer = telescopeBufnr,
                        callback = function()
                            if vim.api.nvim_win_is_valid(winnr) then vim.api.nvim_win_close(winnr, true) end
                            if vim.api.nvim_buf_is_valid(backdropBufnr) then
                                vim.api.nvim_buf_delete(backdropBufnr, { force = true })
                            end
                        end,
                    })
                end,
            })

            require("telescope").setup {
                defaults = {
                    theme = "center",
                    sorting_strategy = "ascending",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.6,
                        },
                    },
                },
            }

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fr", builtin.git_files, { desc = "Telescope find git-files" })
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
            vim.keymap.set("n", "<leader>?",  builtin.keymaps, { desc = "Show keymaps" })
        end
    }
}
