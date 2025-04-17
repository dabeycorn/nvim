require("plugins.bootstrap")
local lazy = require("lazy")
lazy.setup({
    {
	"nvim-telescope/telescope.nvim", tag = "0.1.8",
	cmd = "Telescope",
	lazy = true,
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function() require("plugins.configs.telescope") end
    }    
})
