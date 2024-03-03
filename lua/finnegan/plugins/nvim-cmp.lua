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
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = false,
          maxwidth = 50,
          ellipsois_char = "…",
        }),
      },
    })
  end,
}

