return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"

    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "build",
      options = {
        "-pdf",
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
      },
    }

    vim.g.vimtex_quickfix_ignore_filters = {
      "Underfull",
      "Overfull",
      "specifier changed to",
      "Token not allowed in a PDF string",
    }

    vim.g.vimtex_view_automatic = 1

    vim.g.vimtex_fold_enabled = 1
    vim.g.vimtex_fold_manual = 0

    vim.g.vimtex_imaps_enabled = 0

    vim.g.vimtex_toc_config = {
      name = "TOC",
      layers = { "content", "todo", "include" },
      split_width = 30,
      todo_sorted = 0,
      show_help = 1,
      show_numbers = 1,
    }

    vim.g.vimtex_cite_method = "bibtex"

    vim.g.vimtex_syntax_enabled = 1
    vim.g.vimtex_syntax_conceal_disable = 0

    vim.g.vimtex_compiler_silent = 0
  end,

  config = function()
    vim.keymap.set("n", "<leader>lc", "<cmd>VimtexCompile<CR>", { desc = "LaTeX Compile" })
    vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>", { desc = "LaTeX View PDF" })
    vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocOpen<CR>", { desc = "LaTeX TOC" })
    vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>", { desc = "LaTeX Stop Compile" })
    vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>", { desc = "LaTeX Errors" })
    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexLog<CR>", { desc = "LaTeX Log" })
    vim.keymap.set("n", "<leader>lC", "<cmd>VimtexClean<CR>", { desc = "LaTeX Clean aux files" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "tex",
      callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.conceallevel = 2
        vim.opt_local.spell = false
        vim.opt_local.textwidth = 80
      end,
    })
  end,
}
