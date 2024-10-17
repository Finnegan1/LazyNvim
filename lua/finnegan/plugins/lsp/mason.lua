return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")

		local mason_lspconfig = require("mason-lspconfig")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "→",
					package_uninstalled = "",
				},
			},
		})

		mason_lspconfig.setup({
			--list of servers for mason to install
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"jsonls",
				"yamlls",
				"dockerls",
				"bashls",
				"lua_ls",
				"gopls",
				"pyright",
				"htmx",
			},
			-- auto-insatall configured servers (with lspconfig)
			automatic_install = true,
		})
	end,
}
