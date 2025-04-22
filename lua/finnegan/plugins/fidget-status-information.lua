return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    -- Options related to LSP progress subsystem
    progress = {
      poll_rate = 0,                -- How and when to poll for progress messages
      suppress_on_insert = false,   -- Suppress new messages while in insert mode
      ignore_done_already = false,  -- Ignore new tasks that are already complete
      ignore_empty_message = false, -- Ignore new tasks that don't contain a message
      
      -- Options related to how LSP progress messages are displayed as notifications
      display = {
        render_limit = 16,          -- How many LSP messages to show at once
        done_ttl = 3,               -- How long a message should persist after completion
        done_icon = "✓",            -- Icon shown when all LSP progress tasks are complete
        done_style = "Constant",    -- Highlight group for completed LSP tasks
        progress_ttl = math.huge,   -- How long a message should persist when in progress
        progress_icon = { "dots" }, -- Icon shown when LSP progress tasks are in progress
        progress_style = "WarningMsg", -- Highlight group for in-progress LSP tasks
        group_style = "Title",      -- Highlight group for group name (LSP server name)
        icon_style = "Question",    -- Highlight group for group icons
      },
    },

    -- Options related to notification subsystem
    notification = {
      poll_rate = 10,               -- How frequently to update and render notifications
      filter = vim.log.levels.INFO, -- Minimum notifications level
      history_size = 128,           -- Number of removed messages to retain in history
      override_vim_notify = false,  -- Automatically override vim.notify() with Fidget
      
      -- Options related to how notifications are rendered as text
      view = {
        stack_upwards = true,       -- Display notification items from bottom to top
        icon_separator = " ",       -- Separator between group name and icon
        group_separator = "---",    -- Separator between notification groups
        group_separator_hl = "Comment", -- Highlight group used for group separator
      },

      -- Options related to the notification window and buffer
      window = {
        normal_hl = "Comment",      -- Base highlight group in the notification window
        winblend = 100,             -- Background color opacity in the notification window
        border = "none",            -- Border around the notification window
        zindex = 45,                -- Stacking priority of the notification window
        max_width = 0,              -- Maximum width of the notification window
        max_height = 0,             -- Maximum height of the notification window
        x_padding = 1,              -- Padding from right edge of window boundary
        y_padding = 0,              -- Padding from bottom edge of window boundary
        align = "bottom",           -- How to align the notification window
        relative = "editor",        -- What the notification window position is relative to
      },
    },

    -- Options related to integrating with other plugins
    integration = {
      ["nvim-tree"] = {
        enable = true,              -- Integrate with nvim-tree/nvim-tree.lua (if installed)
      },
    },
  },
}
