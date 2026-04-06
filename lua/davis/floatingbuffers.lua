local state = {
    floating = {
        buf = -1,
        win = -1,
    },
    lines = {},
    buffer_ids = {},
}

 local function create_float(opts)

     local parent_win = vim.api.nvim_get_current_win()

     opts = opts or {}

     local ui = vim.api.nvim_list_uis()[1]

     local width = opts.width or math.floor(ui.width * 0.5)
     local height = opts.height or math.floor(ui.height * 0.5)

     local row = math.floor((ui.height - height) / 2)
     local col = math.floor((ui.width - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
        state.lines = opts.lines
        state.buffer_ids = opts.buffer_ids
    else
        print("Remaking")
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("modifiable",true, { buf = buf} )

        local lines = {}
        local buffer_ids = {}
        local buffer_list = vim.api.nvim_list_bufs()
        for _ , val in ipairs(buffer_list) do

            if vim.bo[val].buflisted then
                local name = vim.api.nvim_buf_get_name(val)
                if name ~= "" then
                    name = vim.fn.fnamemodify(name, ":~:.")
                    table.insert(lines,name )
                    buffer_ids[name] = val
                end
            end
        end

        state.buffer_ids = buffer_ids
        state.lines = lines
        vim.api.nvim_buf_set_lines(buf,0,-1, false, state.lines)
    end

    -- Open floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })


    vim.keymap.set("n", "q", function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_hide(state.floating.win)

        end
    end, { buffer = buf, nowait = true })


    vim.keymap.set("n", "<CR>", function()
            local word = vim.fn.expand("<cWORD>")
            if state.buffer_ids[word] == nil then
                local new_buf = vim.api.nvim_create_buf(true, false)
                vim.api.nvim_buf_set_name(new_buf,word)
                table.insert(state.lines,word)
                state.buffer_ids[word] = new_buf
            end
            vim.api.nvim_win_set_buf(parent_win,state.buffer_ids[word])

            if vim.api.nvim_win_is_valid(win) then
                vim.api.nvim_win_hide(state.floating.win)
            end
        end)

    return {buf = buf,win = win}
end


vim.api.nvim_create_user_command("FloatTerm", function()
    if not vim.api.nvim_win_is_valid(state.floating.win) then
        state.floating = create_float( {
            buf = state.floating.buf,
            buffer_ids = state.buffer_ids,
            lines = state.lines
        })
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end, {} )

vim.keymap.set('n','<leader>t',function()
    vim.cmd("FloatTerm")
end)
