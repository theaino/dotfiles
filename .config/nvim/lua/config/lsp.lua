--[[local configs = require("lspconfig.configs")
--[[ configs.rubymine_lsp = {
	default_config = {
		name = "rubymine_lsp",
		cmd = { "/home/aino/Documents/ideals/lsp.sh" },
		root_dir = require("lspconfig.util").root_pattern("Gemfile"),
		filetypes = { "ruby", "eruby" }
	}
}
require("lspconfig").rubymine_lsp.setup({}) ]]--
