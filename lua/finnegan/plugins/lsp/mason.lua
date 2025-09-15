return {
	{
		"williamboman/mason.nvim",
		version = "^1.0.0", -- Pin to v1.x to avoid compatibility issues
		config = function()
			local mason = require("mason")

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
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		version = "^1.0.0", -- Pin to v1.x to avoid compatibility issues
		dependencies = { "williamboman/mason.nvim" },
		config = function()
			local mason_lspconfig = require("mason-lspconfig")

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
				-- auto-install configured servers (with lspconfig)
				automatic_install = true,
			})

			-- Setup handlers to bridge mason-lspconfig with your manual lspconfig
			-- This ensures installed servers are available to your manual configurations
			mason_lspconfig.setup_handlers({
				-- Default handler for servers not manually configured
				function(server_name)
					-- Only auto-setup servers that aren't manually configured in lspconfig.lua
					local manually_configured = {
						"html", "htmx", "ts_ls", "cssls", "tailwindcss", 
						"pyright", "lua_ls", "gopls"
					}
					
					-- Check if this server is manually configured
					local is_manually_configured = false
					for _, manual_server in ipairs(manually_configured) do
						if server_name == manual_server then
							is_manually_configured = true
							break
						end
					end
					
					-- Only auto-setup if not manually configured
					if not is_manually_configured then
						require("lspconfig")[server_name].setup({})
					end
				end,
			})
		end,
	},
}
