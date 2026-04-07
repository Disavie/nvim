return {
    --dir = "/home/davis/nvim-plugins/quickbuf.nvim",
    "Disavie/quickbuf.nvim",

    config = function()
        local qb = require("quickbuf")
        qb.setup()
    end
}
