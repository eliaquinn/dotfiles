return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    require("nvim-treesitter.config").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "terraform" },
        disable = { "tmux" },
      },
      indent = { enable = true },
      autotag = { enable = true },
      ensure_installed = {
        "json","javascript","typescript","tsx","yaml","html","css","prisma",
        "markdown","markdown_inline","svelte","graphql","hcl","helm","toml","regex",
        "bash","lua","python","vim","dockerfile","gitignore","query","terraform",
        "vimdoc","c","tmux",
      },
      auto_install = true,
      sync_install = false,
    })
  end,
}
