return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*",
  opts = {
    provider = 'gemini_pro',
    auto_suggestions_provider = nil,
    cursor_applying_provider = 'gemini_flash',
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = true,
      support_paste_from_clipboard = true,
      enable_cursor_planning_mode = true,
    },
    openai = {
      endpoint = "https://api.openai.com/v1/",
      model = "gpt-4o",
      temperature = 0,
      max_tokens = 16384,
    },
    claude = {
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219",
      temperature = 0,
      max_tokens = 16000,
      reasoning_effort = "medium",
    },
    vendors = {
      groq = { -- define ggroq provider
        __inherited_from = 'openai',
        api_key_name = 'GROQ_API_KEY',
        endpoint = 'https://api.groq.com/openai/v1/',
        model = 'llama-3.3-70b-versatile',
        max_tokens = 32768,
      },
      gemini_pro = {
        __inherited_from = 'gemini',
        model = "gemini-2.5-pro-exp-03-25",
        max_tokens = 50000,
      },
      gemini_flash = {
        __inherited_from = 'gemini',
        model = "gemini-2.0-flash",
        max_tokens = 8191,
      },
      gemini_flash_think = {
        __inherited_from = 'gemini',
        model = "gemini-2.0-flash-thinking-exp-01-21",
        max_tokens = 8191,
      },
    },
    web_search_engine = {
      provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          --use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  setup = function()
    require('avante_lib').load()
  end,
}
