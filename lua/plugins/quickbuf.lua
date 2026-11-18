return {
    dir = "/home/davis/projects/nvim-plugins/quickbuf.nvim",
    --"Disavie/quickbuf.nvim",

    config = function()
        local qb = require("quickbuf")
        qb.setup()
    end
}
