return {
  "leafOfTree/vim-svelte-plugin",
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = "v0.*",
    lazy = false,

    opts = {
      keymap = {
        preset = 'default',
      },
      sources = {
        default = { 'lsp', 'dadbod', 'buffer', 'snippets' },

        providers = {
          lsp = {
            name = 'lsp',
            enabled = true,
            module = "blink.cmp.sources.lsp",
            score_offset = 1000,
          },
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
      fuzzy = {
        use_typo_resistance = true,
        use_frecency = true,
        use_proximity = true,
        sorts = { 'score', 'label' },

        prebuilt_binaries = {
          download = true,
          force_version = nil,
          force_system_triple = nil,
        },
      },
    },
    opts_extend = { "sources.default" }
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/neodev.nvim"
    },
    opts = {
      servers = {
        ts_ls = {},
        tailwindcss = {},
        jsonls = {},
        css_variables = {},
        cssmodules_ls = {},
        html = {},
        svelte = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { 'missing-fields' } },
            }
          }
        },
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore"
              }
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore"
              }
            },
            less = {
              validate = true,
              lint = {
                unknownAtRules = "ignore"
              }
            },
          }
        },
      },
    },
    config = function(_, opts)
      require("neodev").setup()

      local lspconfig = require('lspconfig')
      local mason = require("mason")
      mason.setup()

      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- Format on save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({
                  bufnr = args.buf,
                  id = client.id
                })
              end
            })
          end
        end
      })
    end
  },
}