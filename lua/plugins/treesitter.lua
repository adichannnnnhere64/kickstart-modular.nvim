return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.config',
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      require('nvim-treesitter.config').setup(opts)
      vim.api.nvim_create_autocmd('Filetype', {
        callback = function(args)
          local _, treesitter = pcall(require, 'nvim-treesitter')
          if _ == nil or not treesitter then
            -- we weren't able to import tree sitter
            return
          end
          if not vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
            -- We don't have a parser for this filetype
            return
          end
          -- Handle auto install?
          -- Handle disablement
          vim.treesitter.start(args.buf)
        end,
      })
    end,
  },
}
