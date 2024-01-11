-- lsp and related features setup

-- keybinds that are only active while nvim is in a lsp-supported buffer
local on_attach = function(_, bufnr)

  -- convenience function for buffer specific keybinds
  local buffer_keybind = function(keys, func, desc)
    local opts = {buffer = bufnr, remap = false, desc = desc}
    vim.keymap.set('n', keys, func, opts)
  end

  buffer_keybind("<leader>ld", function() vim.lsp.buf.definition() end, "goto Definition")
  buffer_keybind("<leader>lh", function() vim.lsp.buf.hover() end, "display help")
  buffer_keybind("<leader>le", function() vim.diagnostic.open_float() end, "open Diagnostics")
  buffer_keybind("[d", function() vim.diagnostic.goto_next() end, "goto next")
  buffer_keybind("]d", function() vim.diagnostic.goto_prev()end, "goto prev")
  buffer_keybind("<leader>lc", function() vim.lsp.buf.code_action() end, "show Code actions")
  buffer_keybind("<leader>li", function() vim.lsp.buf.references() end, "display references")
  buffer_keybind("<leader>lr", function() vim.lsp.buf.rename() end, "rename variable")
end


-- keybinds used in completions
local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- selects next option on completion menu
local select_next = function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

-- selects prev option on completion menu
local select_prev = function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end

-- starts/progresses through current snippet
local snippet_jump = function(fallback)
  if luasnip.expand_or_locally_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end

-- reverses through current snippet
local snippet_unjump = function(fallback)
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end


-- my default lsp servers
-- hint: extras can be installed from :Mason
local servers = { "clangd", "pyright", "lua_ls", "taplo", "jsonls", "bashls"}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure mason is installed
local mason_lspconfig = require 'mason-lspconfig'
mason_lspconfig.setup {
  -- default lsp servers installed here
  ensure_installed = servers
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}



-- setup luasnip
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

-- setup completions
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-j>'] = cmp.mapping.scroll_docs(2),
    ['<C-k>'] = cmp.mapping.scroll_docs(-2),
    ['<Tab>'] = cmp.mapping(select_next, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(select_prev, { 'i', 's' }),
    ['<leader><space>'] = cmp.mapping(snippet_jump, { 'i', 's' }),
    ['<leader><BS>'] = cmp.mapping(snippet_unjump, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

