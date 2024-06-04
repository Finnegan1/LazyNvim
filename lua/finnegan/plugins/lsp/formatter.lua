Custom_format = function()
  if vim.bo.filetype == "templ" then
    local bufnr = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(bufnr)
    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

    vim.fn.jobstart(cmd, {
      on_exit = function()
        -- Reload the buffer only if it's still the current buffer
        if vim.api.nvim_get_current_buf() == bufnr then
          vim.cmd('e!')
        end
      end,
    })
  else
    vim.lsp.buf.format()
  end
end




return {
  "mhartington/formatter.nvim",
  config = function()
    local util = require("formatter.util")
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        -- Formatter configurations for filetype "lua" go here
        -- and will be executed in order
        lua = {
          -- "formatter.filetypes.lua" defines default configurations for the
          -- "lua" filetype
          require("formatter.filetypes.lua").stylua,
        },
        -- Formatter configurations for filetype "javascript" go here
        javascript = {
          -- "formatter.filetypes.javascript" defines default configurations for the
          -- "javascript" filetype
          require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
          -- "formatter.filetypes.javascript" defines default configurations for the
          -- "javascript" filetype
          require("formatter.filetypes.javascriptreact").prettier,
        },
        -- Formatter configurations for filetype "typescript" go here
        typescript = {
          -- "formatter.filetypes.typescript" defines default configurations for the
          -- "typescript" filetype
          require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
          -- "formatter.filetypes.typescript" defines default configurations for the
          -- "typescript" filetype
          require("formatter.filetypes.typescriptreact").prettier,
        },
        -- Formatter configurations for filetype "python" go here
        python = {
          -- "formatter.filetypes.python" defines default configurations for the
          -- "python" filetype
          require("formatter.filetypes.python").autopep8,
        },
        -- Formatter configurations for filetype "golang" go here
        go = {
          -- "formatter.filetypes.golang" defines default configurations for the
          -- "golang" filetype
          require("formatter.filetypes.go").gofmt,
        },
        -- Formatter configurations for filetype "json" go here
        json = {
          -- "formatter.filetypes.json" defines default configurations for the
          -- "json" filetype
          require("formatter.filetypes.json").prettier,
        },
        -- Formatter configurations for filetype "yaml" go here
        yaml = {
          -- "formatter.filetypes.yaml" defines default configurations for the
          -- "yaml" filetype
          require("formatter.filetypes.yaml").prettier,
        },
        -- Formatter configurations for filetype "html" go here
        html = {
          -- "formatter.filetypes.html" defines default configurations for the
          -- "html" filetype
          require("formatter.filetypes.html").prettier,
        },
        -- Formatter configurations for filetype "css" go here
        css = {
          -- "formatter.filetypes.css" defines default configurations for the
          -- "css" filetype
          require("formatter.filetypes.css").prettier,
        },
        -- Formatter configurations for filetype "markdown" go here
        markdown = {
          -- "formatter.filetypes.markdown" defines default configurations for the
          -- "markdown" filetype
          require("formatter.filetypes.markdown").prettier,
        },
        -- Formatter configurations for filetype "rust" go here
        rust = {
          -- "formatter.filetypes.rust" defines default configurations for the
          -- "rust" filetype
          require("formatter.filetypes.rust").rustfmt,
        },
        -- Formatter configurations for filetype "xml" go here
        xml = {
          function()
            return {
              exe = "xmlformat",
              args = {},
              stdin = true,
            }
          end,
        },
        -- Formatter configurations for filetype "zsh" go here
        zsh = {
          require("formatter.filetypes.zsh").beautysh,
        },
        -- Formatter configurations for filetype "templ" go here
        ["*"] = {
          -- "formatter.filetypes.any" defines default configurations for any
          -- filetype
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })


    vim.keymap.set(
      "n",
      "<leader>f",
      Custom_format,
      { noremap = true, silent = true, desc = "Format File" }
    )

    -- on save
    --[[
    vim.api.nvim_set_keymap(
			"n",
			"<leader>f",
			":Format<CR>",
			{ noremap = true, silent = true, desc = "Format File" }
		)

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",:
			command = ":FormatWrite",
		})
		]]
  end
}
