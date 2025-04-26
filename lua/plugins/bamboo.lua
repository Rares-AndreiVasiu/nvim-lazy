return  
{
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        -- optional configuration here
      }
      require('bamboo').load()
    end,
    config = function()
        vim.cmd.colorscheme "bamboo"
    end
}


