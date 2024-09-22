if vim.g.vscode then
	require("reyvn.extras.vscode")
else
	require("reyvn.config.init")
	require("reyvn.config.lazy")
end
