return {
    "tiagovla/tokyodark.nvim",
    opts = {
        transparent = true,
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
}
