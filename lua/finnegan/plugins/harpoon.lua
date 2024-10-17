
return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "ThePrimeagen/harpoon",
    "folke/which-key.nvim",
  },
  config = function()
    require("harpoon"):setup({})
  end,
}
