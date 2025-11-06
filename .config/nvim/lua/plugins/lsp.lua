return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = true,
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },

        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
                autoImportCompletions = true,
              },
            },
          },
        },

        ruff = {
          init_options = {
            settings = {
              lineLength = 88,
              lint = {
                select = {
                  "E", -- pycodestyle errors
                  "W", -- pycodestyle warnings
                  "F", -- pyflakes
                  "I", -- isort
                  "B", -- flake8-bugbear
                  "C4", -- flake8-comprehensions
                  "UP", -- pyupgrade
                },
              },
            },
          },
        },

        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
                loadOutDirsFromCheck = true,
                buildScripts = {
                  enable = true,
                },
              },
              procMacro = {
                enable = true,
              },
              checkOnSave = {
                command = "clippy",
                extraArgs = { "--all", "--all-features" },
              },
              inlayHints = {
                bindingModeHints = {
                  enable = true,
                },
                chainingHints = {
                  enable = true,
                },
                closingBraceHints = {
                  minLines = 10,
                },
                closureReturnTypeHints = {
                  enable = "with_block",
                },
                lifetimeElisionHints = {
                  enable = "skip_trivial",
                  useParameterNames = true,
                },
                parameterHints = {
                  enable = true,
                },
                typeHints = {
                  enable = true,
                },
              },
              completion = {
                callable = {
                  snippets = "fill_arguments",
                },
              },
            },
          },
        },

        texlab = {
          settings = {
            texlab = {
              build = {
                onSave = true,
                forwardSearchAfter = true,
              },
              forwardSearch = {
                executable = "zathura",
                args = { "--synctex-forward", "%l:1:%f", "%p" },
              },
              chktex = {
                onEdit = false,
                onOpenAndSave = true,
              },
            },
          },
        },

        ltex = {
          filetypes = { "tex", "latex", "bib", "markdown" },
          settings = {
            ltex = {
              enabled = { "latex", "tex", "bib", "markdown" },
              language = "es",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "es",
              },
              checkFrequency = "save",
              diagnosticSeverity = "information",
              setenceCacheSize = 2000,
              completionEnabled = true,
              dictionary = {
                ["es"] = {
                  "LaTeX",
                  "Neovim",
                  "backend",
                  "frontend",
                  "API",
                  "JSON",
                  "HTTP",
                  "HTTPS",
                },
              },
              disabledRules = {
                ["es"] = {
                  "WHITESPACE_RULE",
                  "DOUBLE_PUNCTUATION",
                },
              },
              latex = {
                commands = {
                  ["\\cite{}"] = "ignore",
                  ["\\citep{}"] = "ignore",
                  ["\\citet{}"] = "ignore",
                  ["\\ref{}"] = "ignore",
                  ["\\eqref{}"] = "ignore",
                  ["\\label{}"] = "ignore",
                  ["\\autoref{}"] = "ignore",
                  ["\\href{}{}"] = "ignore",
                  ["\\url{}"] = "ignore",
                },
                environments = {
                  ["lstlisting"] = "ignore",
                  ["verbatim"] = "ignore",
                  ["equation"] = "ignore",
                  ["equation*"] = "ignore",
                  ["align"] = "ignore",
                  ["align*"] = "ignore",
                  ["tikzpicture"] = "ignore",
                  ["code"] = "ignore",
                },
              },
            },
          },
        },
        ts_ls = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },

        html = {
          filetypes = { "html", "htmldjango" },
        },

        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },

        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },

        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
          },
        },
      },
    },
  },
}
