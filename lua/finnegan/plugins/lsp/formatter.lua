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
			},
		})

		vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true, desc = "Format File" })

		-- on save
		--[[
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",:
			command = ":FormatWrite",
		})
		]]
	end,
}
