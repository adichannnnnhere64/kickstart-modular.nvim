in order for this test to work, you have to register neotest-java adapters into `nvim/lua/custom/plugins/neotest.lua`

```lua
     config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-java',

        },
      }
    end,
```
