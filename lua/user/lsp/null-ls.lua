require("null-ls").setup({
  sources = {
    -- 需要手动安装prettier
    require("null-ls").builtins.formatting.prettier,
    require("null-ls").builtins.code_actions.eslint,
  },
})
