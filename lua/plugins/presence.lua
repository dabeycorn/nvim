return {
  "andweeb/presence.nvim",
  event = "BufEnter",
  config = function()
    require("presence").setup({
      neovim_image_text = "I can't close this help",
      main_image = "file",      
      debounce_timeout = 5,
      editing_text = "Editing %s",
      workspace_text = "Working on %s",
      reading_text = "Reading %s",
      auto_update = true,
      main_image = "file",
      show_time = true,
    })
  end
}
