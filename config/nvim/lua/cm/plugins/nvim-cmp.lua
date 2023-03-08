local cmp = require('cmp')

cmp.setup {
  snippet = {
    expand = function(args)
      require('snippy').expand_snippet(args.body)
    end,
  },
  formatting = {
    format = function(entry, vim_item)
      -- set a name for each source
      vim_item.menu = ({
        buffer = '[buffer]',
        emoji = '[emoji]',
        nvim_lsp = '[lsp]',
        snippy = '[snippet]',
        nvim_lua = '[lua]',
        path = '[path]',
        spell = '[spell]',
        rails_fixture_names = '[fixture]',
        rails_fixture_types = '[fixture]'
      })[entry.source.name]
      return vim_item
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-p>'] = cmp.mapping.select_prev_item(),
    ['<c-n>'] = cmp.mapping.select_next_item(),
    ['<c-u>'] = cmp.mapping.scroll_docs(-4),
    ['<c-d>'] = cmp.mapping.scroll_docs(4),
    ['<c-space>'] = cmp.mapping.complete({}),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<cr>'] = cmp.mapping.confirm { select = true },
  }),
  sources = {
    { name = 'snippy' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'buffer' },
    { name = 'emoji' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'rails_fixture_names' },
    { name = 'rails_fixture_types' }
  },
  completion = { completeopt = 'menu,menuone,noinsert' }
}

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'buffer' },
    { name = 'emoji' },
    { name = 'spell' },
  })
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
