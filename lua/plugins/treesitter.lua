return 
{
    'nvim-treesitter/nvim-treesitter',

    build = ":TSUpdate",
    
    config = function()
        local tree_config = require("nvim-treesitter.configs")

        tree_config.setup({
            ensure_installed = {"lua", "c", "rust", "verilog", "python"},

            highlight = { enable = true},

            indent = {enable = true},
        })
    end
}
