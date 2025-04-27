return {
    {
        "williamboman/mason.nvim",

        config = function()
            require("mason").setup()
        end
    },    
    {
        "williamboman/mason-lspconfig.nvim",
        
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"lua_ls", "cmake", "clangd", "rust_analyzer",
                "hdl_checker", "pyright"}
            })
        end
    },

    {
        "neovim/nvim-lspconfig",
        
        lazy = false,

        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            
            -- lua language server link to nvim
            lspconfig.lua_ls.setup({
                capabilities = capabilities
            })
            
            -- cmake language server link to nvim
            lspconfig.cmake.setup({
                capabilities = capabilities
            })

            -- clang for C/C++ support
            lspconfig.clangd.setup({
                capabilities = capabilities
            })

            --  python language server
            lspconfig.pyright.setup({
                capabilities = capabilities
            })

            -- rust language server
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities
            })

            -- verilog language server
            lspconfig.hdl_checker.setup({
                capabilities = capabilities
            })
           
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            
            vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
