custom_pickers = require('cm.plugins.telescope.custom_pickers')

require('telescope').setup {
  defaults = {
    file_ignore_patterns = {
      '.git/',
      'tags',
      'tags.lock',
      'tags.temp',
      'tags.temp.tmp'
    }
  },
  pickers = {
    find_files = {
      hidden = true
    },
    live_grep = {
      mappings = {
        i = {
          ['<C-f>'] = custom_pickers.actions.set_extension,
          ['<C-l>'] = custom_pickers.actions.set_folders,
        },
      },
    },
  },
  extensions = {
    project = {
      base_dirs = {
        '~/Code'
      }
    }
  }
}

require('telescope').load_extension('project')
