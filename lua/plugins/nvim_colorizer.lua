local utils = require("utils")


local ok, colorizer = pcall(require, "colorizer")
if not ok then
    utils.warn_module_import_fail("colorizer")
    return
end

colorizer.setup()
