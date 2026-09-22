return {
  {
    'olimorris/codecompanion.nvim',
    version = '^19.0.0',
    opts = {
      interactions = {
        chat = {
          adapter = 'openrouter',
        },
      },
      adapters = {
        http = {
          openrouter = function()
            return require('codecompanion.adapters').extend('openrouter', {
              env = {
                api_key = 'file:~/.openrouter_api_key',
              },
            })
          end,
          albert = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                url = 'https://albert.api.etalab.gouv.fr',
                api_key = 'file:~/.albert_api_key',
                chat_url = '/v1/chat/completions',
              },
              schema = {
                model = {
                  default = 'openai/gpt-oss-120b',
                  -- choices = {
                  --   'openai/gpt-oss-120b',
                  --   'openai/deepseek-v4-flash-0731',
                  -- },
                },
              },
            })
          end,
        },
      },
      mcp = {
        servers = {
          context7 = {
            cmd = {
              'npx',
              '-y',
              '@upstash/context7-mcp',
            },
          },
        },
      },
    },
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
      'nvim-treesitter/nvim-treesitter',
    },
  },
}
