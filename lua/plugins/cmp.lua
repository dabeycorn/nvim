return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'saadparwaiz1/cmp_luasnip',
    'lukas-reineke/cmp-under-comparator',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lua',
    'lukas-reineke/cmp-rg',
    "neovim/nvim-lspconfig",

    --[[{
      'onsails/lspkind-nvim',
        config = function()
          require('lspkind').init()
        end,
    },]]--
  },
  config = function()
    local cmp = require('cmp')
    local cmp_buffer = require('cmp_buffer')
    local compare = require('cmp.config.compare')
    local luasnip = require('luasnip')

    luasnip.config.setup({})
    cmp.setup({
            window = {
                completion = {
                    border = 'rounded',
                    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                },
                documentation = {
                    border = 'rounded',
                    winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete({}),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'nvim_lua' },
            }, {
                {
                    name = 'buffer',
                    option = {
                        -- Complete from all visible buffers.
                        get_bufnrs = function()
                            return vim.api.nvim_list_bufs()
                        end,
                    },
                },
            }),
            sorting = {
                comparators = {
                    -- Sort by distance of the word from the cursor
                    -- https://github.com/hrsh7th/cmp-buffer#locality-bonus-comparator-distance-based-sorting
                    function(...)
                        return cmp_buffer:compare_locality(...)
                    end,
                    compare.offset,
                    compare.exact,
                    compare.score,
                    require('cmp-under-comparator').under,
                    compare.recently_used,
                    compare.locality,
                    compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
        })
        -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      require('lspconfig')['ccls'].setup {
          init_options = {
          compilationDatabaseDirectory = "build";
          index = {
            threads = 0;
          };
          clang = {
            excludeArgs = { "-frounding-math"} ;
          };
        }
      }
      require('lspconfig')['jdtls'].setup{
        
      }
  end 
}
