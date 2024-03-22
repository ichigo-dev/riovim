-------------------------------------------------------------------------------
-- LSP.
--------------------------------------------------------------------------------

local mason_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_status_ok then
    return
end

local lsp_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_status_ok then
    return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_status_ok then
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
mason_lspconfig.setup_handlers {
    function(server_name)
        local cmd = nil
        if server_name == "intelephense" then
            cmd = { "env", "HOME=/tmp", "intelephense", "--stdio" }
        end

        lspconfig[server_name].setup {
            capabilities = capabilities,
            cmd = cmd,
            handlers = {
                ["textDocument/publishDiagnostics"] = vim.lsp.with(
                    vim.lsp.diagnostic.on_publish_diagnostics, {
                        virtual_text = false,
                        signs = true,
                        underline = true,
                        update_in_insert = true,
                    }
                ),
            },
        }
    end,
}
