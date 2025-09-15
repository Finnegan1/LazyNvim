return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = "*",
    opts = {
      provider = 'openrouter',
      auto_suggestions_provider = nil,
      cursor_applying_provider = 'openrouter_apply',
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
        openrouter_apply = {
          __inherited_from = 'openai',
          endpoint = 'https://openrouter.ai/api/v1',
          api_key_name = 'OPENROUTER_API_KEY_AVANTE',
          model = 'google/gemini-2.5-pro-preview',
        },
        openrouter = {
          __inherited_from = 'openai',
          endpoint = 'https://openrouter.ai/api/v1',
          api_key_name = 'OPENROUTER_API_KEY_AVANTE',
          model = 'google/gemini-2.5-pro-preview',
        },
      },
      web_search_engine = {
        provider = "tavily", -- tavily, serpapi, searchapi, google or kagi
      },
      -- system_prompt as function ensures LLM always has latest MCP server state
      -- This is evaluated for every message, even in existing chats
      -- system_prompt = function()
      --   local hub = require("mcphub").get_hub_instance()
      --   return hub and hub:get_active_servers_prompt() or ""
      -- end,
      -- -- Using function prevents requiring mcphub before it's loaded
      -- custom_tools = function()
      --   return {
      --     require("mcphub.extensions.avante").mcp_tool(),
      --   }
      -- end,
      -- disabled_tools = {
      --   "list_files",    -- Built-in file operations
      --   "search_files",
      --   "read_file",
      --   "create_file",
      --   "rename_file",
      --   "delete_file",
      --   "create_dir",
      --   "rename_dir",
      --   "delete_dir",
      --   "bash",         -- Built-in terminal access
      -- },
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
  },
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    config = function()
        require("mcphub").setup({
          extensions = {
              avante = {
                  make_slash_commands = true, -- make /slash commands from MCP server prompts
              }
          }
      })
    end
  }
}
