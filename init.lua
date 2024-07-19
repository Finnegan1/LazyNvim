require("finnegan.core.mapping")
require("finnegan.core.options")
require("finnegan.core.diagnostics")
require("finnegan.core.refactoring")
require("finnegan.lazy")

if vim.g.vscode then
    print("VSCode extension")
else
    print("ordinary Neovim")
end
