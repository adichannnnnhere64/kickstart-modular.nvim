return {
  'nvim-java/nvim-java',

  config = function()
    require('java').setup {
      -- Use your SDKMAN Java 21 installation for JDTLS
      java_runtime = '/home/adrian/.sdkman/candidates/java/current',
      -- OR if you prefer a version string (nvim-java may auto-resolve):
      -- java_runtime = '21',
    }

    vim.lsp.enable 'jdtls'

    vim.lsp.config('jdtls', {
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = 'Java 21',
                path = '/home/adrian/.sdkman/candidates/java/21.0.2-tem',
                default = true,
              },
              {
                name = 'Java 25',
                path = '/home/adrian/.sdkman/candidates/java/25.0.2-tem',
              },
            },
          },
        },
      },
    })
  end,
}
