return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = true,
      servers = {
        vtsls = {
          settings = {
            typescript = {
              -- HACK: Disable Inlay Hints
              inlayHints = {
                parameterNames = { enabled = "none" },
                parameterTypes = { enabled = false },
                variableTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                enumMemberValues = { enabled = false },
              },
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
        stimulus_ls = {
          root_dir = function()
            return vim.fn.getcwd()
          end,
        },
      },
    },
  },
}
