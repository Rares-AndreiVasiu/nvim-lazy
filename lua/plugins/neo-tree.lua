return
{
    "nvim-neo-tree/neo-tree.nvim",

    branch = "v3.x",
    
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- Recommended, but not strictly required
      "MunifTanjim/nui.nvim",
    },
    
    lazy = false,
    
    opts = {
      -- fill any relevant options here
    },

    config = function()
    
        vim.keymap.set("n", "<C-t>", function()
        require("neo-tree.command").execute({
            toggle = true,
            source = "filesystem",
            position = "right"
        })
        end, 
        { silent = true })
    end
  }

