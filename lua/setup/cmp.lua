local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup({
    snippet = {
      expand = function(args)
	require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently elected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping.confirm {
	  behavior = cmp.ConfirmBehavior.Insert,
	  select = true
      }
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp', keyword_length = 3, max_item_count = 15 },
        { name = 'buffer' },
    }),
    formatting = {
      format = lspkind.cmp_format {
	with_text = true,
	menu = {
	  nvim_lsp = '[LSP]',
	  buffer = '[buf]'
	}
      }
    }
})

