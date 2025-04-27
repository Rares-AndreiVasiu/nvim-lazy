return 
{
    'nvim-treesitter/nvim-treesitter',

    build = ":TSUpdate",
    
    config = function()
        local tree_config = require("nvim-treesitter.configs")

        tree_config.setup({
            auto_install = true,

            highlight = { enable = true},

            indent = {enable = true},
        })
    end
}
