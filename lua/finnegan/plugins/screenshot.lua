return {
  "mistricky/codesnap.nvim",
  build = "make build_generator",
  keys = {
    { "<leader>cc", "<cmd>CodeSnap<cr>",     mode = "x", desc = "Save selected code snapshot into clipboard" },
    { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
  },
  setup = function()
    require("codesnap").setup(
      {
        save_path = "~/Pictures/codeShots",
        has_breadcrumbs = false,
        show_workspace = false,
        bg_theme = "bamboo",
      }
    )
  end
}
