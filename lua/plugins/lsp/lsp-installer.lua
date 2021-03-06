local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not ok then
    return
end



lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("plugins.lsp.handlers").on_attach,
        capabilities = require("plugins.lsp.handlers").capabilities,
    }


    if server.name == "sumneko_lua" then
        local sumneko_opts = require("plugins.lsp.settings.sumneko_lua")
        opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

    server:setup(opts)
end)
