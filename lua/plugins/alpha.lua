return {
  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
        require'alpha.themes.dashboard'.section.header.val = {}
    end
  };
}
