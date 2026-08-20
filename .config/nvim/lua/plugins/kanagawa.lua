return {
  -- 1. Настраиваем и скачиваем плагин Kanagawa
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    --priority = 999,
    opts = {
      transparent = true, -- ВКЛЮЧАЕТ ПРОЗРАЧНЫЙ ФОН
      theme = "wave", -- Вы можете изменить на "dragon" или "lotus"
    },
  },

  -- 2. Говорим LazyVim использовать эту тему
  {
    "LazyVim/LazyVim",
    opts = {
      --colorscheme = "kanagawa",
    },
  },
}
