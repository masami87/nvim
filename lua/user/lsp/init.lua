local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end


local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]] ,
      false
    )
  end
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- 不用tsserver提供的formatting, 用null-ls
  -- 参考https://www.youtube.com/watch?v=b7OguLuaYvE&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ&index=17&t=144s
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
  }

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then

  --     opts.root_dir = function() ... end
  -- end
  if server.name == "html" then
    -- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities) 该行已经做了下面这步
    -- opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    local html_opts = require("user.lsp.settings.html")
    opts = vim.tbl_deep_extend("force", html_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("user.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)

  end

  -- NOTE: for rust-tools
  if server.name == "rust_analyzer" then
    -- Update this path
    -- NOTE: 指定调试器为Codelldb
    local extension_path = '/home/masami/software/codelldb/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'

    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'

    local rustopts = {
      tools = {

        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
          show_parameter_hints = true,
          parameter_hints_prefix = ": ",
          other_hints_prefix = "=> ",
          -- The color of the hints
          highlight = "Comment",
        },
      },
      server = vim.tbl_deep_extend("force", server:get_default_options(), opts, {
        settings = {
          ["rust-analyzer"] = {
            -- completion = {
            --     postfix = {
            --         enable = false
            --     }
            -- },
            -- checkOnSave = {
            --     command = "clippy"
            -- },
          }
        }
      }),
      -- debugging stuff
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(
          codelldb_path, liblldb_path)
      }
    }
    require("rust-tools").setup(rustopts)
    server:attach_buffers()
    return
  end


  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)


-- fidget.nvim for lsp progress
require "fidget".setup {}
-- 启用null-ls
require "user.lsp.null-ls"
