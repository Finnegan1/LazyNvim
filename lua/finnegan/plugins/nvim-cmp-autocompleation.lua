




return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- suggestions based on the current buffer
    "hrsh7th/cmp-path", -- path autocompletion
    "hrsh7th/cmp-nvim-lsp", -- LSP support
    "onsails/lspkind-nvim", -- enhance the appearance of the auto-completion menu
    "L3MON4D3/LuaSnip", -- snippet engine -> allows to define and use snippets of code
    "saadparwaiz1/cmp_luasnip",  -- for autocompletion with LuaSnip
    "rafamadriz/friendly-snippets", -- usefull snippets
    "kristijanhusak/vim-dadbod-completion", -- db compleation
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- load snippets from plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    vim.opt.completeopt = "menu,menuone,noselect"

    cmp.setup({
      completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged },
        keyword_length = 1,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- Enter key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        -- Shift + Enter to confirm first completion suggestion
        ['<S-CR>'] = cmp.mapping.confirm({ select = true }),
        -- Ctrl+Space to trigger completion menu
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Navigate through completion menu
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),

        ["<C-e>"] = cmp.mapping.close(),
      }),
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
        { name = "vim-dadbod-completion", priority = 700 },
        --{ name = "supermaven", priority = 100 },
      },
      formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            rg = '[Rg]',
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            vsnip = '[Snippet]',
            tags = '[Tag]',
            path = '[Path]',
            orgmode = '[Org]',
            supermaven = '[AI]',
            ['vim-dadbod-completion'] = '[DB]',
          })[entry.source.name]
          return vim_item
        end,
      },
--      formatting = {
--        format = lspkind.cmp_format({
--          with_text = false,
--          maxwidth = 50,
--          ellipsois_char = "…",
--        }),
--      },
    
      window = {
        documentation = {
          border = 'rounded',
        },
      },
    })


    local autocomplete_group = vim.api.nvim_create_augroup('vimrc_autocompletion', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'sql', 'mysql', 'plsql' },
      callback = function()
        cmp.setup.buffer({ sources = { { name = 'vim-dadbod-completion' } } })
      end,
      group = autocomplete_group,
    })

    vim.opt.wildignore = {
      '*.o',
      '*.obj,*~',
      '*.git*',
      '*.meteor*',
      '*vim/backups*',
      '*sass-cache*',
      '*mypy_cache*',
      '*__pycache__*',
      '*cache*',
      '*logs*',
      '*node_modules*',
      '**/node_modules/**',
      '*DS_Store*',
      '*.gem',
      'log/**',
      'tmp/**',
    }
  end,
}


