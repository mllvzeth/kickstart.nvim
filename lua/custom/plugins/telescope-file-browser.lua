return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true,
          mappings = {
            ['i'] = {
              -- Insert mode mappings
            },
            ['n'] = {
              -- Normal mode mappings
              -- c = create file/folder
              -- r = rename
              -- m = move
              -- y = copy
              -- d = delete
              -- o = open
              -- g = goto parent dir
              -- e = goto home dir
              -- w = goto cwd
              -- t = change cwd
              -- f = toggle browser
              -- h = toggle hidden
            },
          },
        },
      },
    }
    require('telescope').load_extension 'file_browser'
  end,
  keys = {
    {
      '<leader>fb',
      ':Telescope file_browser<CR>',
      desc = '[F]ile [B]rowser',
    },
    {
      '<leader>fB',
      ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
      desc = '[F]ile [B]rowser (current file)',
    },
  },
}