return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = true,
    config = false,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {"L3MON4D3/LuaSnip"},
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = {
          {name = "path"},
          {name = "nvim_lsp"},
          {name = "luasnip", keyword_length = 2},
          {name = "buffer", keyword_length = 3},
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Enter>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
        }),
      })
    end
  },

  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    lazy = false,
    event = {"BufReadPre", "BufNewFile"},
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"williamboman/mason.nvim"},
      {"williamboman/mason-lspconfig.nvim"},
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      local lsp_attach = function(_, bufnr)
        vim.keymap.set("n", "gK", "<cmd>lua vim.lsp.buf.hover()<cr>", {buffer = bufnr, desc = "LSP: Hover"})
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", {buffer = bufnr, desc = "LSP: Go to definition"})
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", {buffer = bufnr, desc = "LSP: Go to declaration"})
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {buffer = bufnr, desc = "LSP: Go to implementation"})
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", {buffer = bufnr, desc = "LSP: Go to type definition"})
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", {buffer = bufnr, desc = "LSP: Go to references"})
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", {buffer = bufnr, desc = "LSP: Signature help"})
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", {buffer = bufnr, desc = "LSP: Buffer rename"})
        vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", {buffer = bufnr, desc = "LSP: Buffer format"})
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", {buffer = bufnr, desc = "LSP: Code actions"})
      end

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        float_border = "rounded",
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"},
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })

      require("lspconfig").lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = {"vim"}
            }
          }
        }
      }
    end
  },
}