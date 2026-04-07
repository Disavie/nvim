local state = {
    floating = {
        buf = -1,
        win = -1,
    },
    buffer_ids = {},
    ordered_names = {},
}

 local function create_float(opts)

     local parent_win = vim.api.nvim_get_current_win()

     opts = opts or {}

     local ui = vim.api.nvim_list_uis()[1]

     local width = opts.width or math.floor(ui.width * 0.3)
     local height = opts.height or math.floor(ui.height * 0.3)

     local row = math.floor((ui.height - height) / 2)
     local col = math.floor((ui.width - width) / 2)

    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
        state.buffer_ids = opts.buffer_ids
        state.ordered_names = opts.ordered_names
    else
        print("Remaking")
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_set_option_value("modifiable",true, { buf = buf} )

    end

    local function remove_buffers()
        local current = vim.api.nvim_list_bufs()
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

        local current_set = {}
        for _, bname in ipairs(lines) do
            current_set[bname] = true
        end
        --print(vim.inspect(current_set))
        --print(vim.inspect(state.buffer_ids))

        for name, b in pairs(state.buffer_ids) do
            if not current_set[name] then
                state.buffer_ids[name] = nil
                vim.cmd("bd"..b)
            end
        end
    end

    -- Updating the buffer list
    -- Get list of active buffers
    --
    local function reload_buffers()
        for _, val in ipairs(vim.api.nvim_list_bufs()) do
            if vim.bo[val].buflisted then
                local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(val), ":~:.")
                if name ~= "" then
                    state.buffer_ids[name] = val
                    table.insert(state.ordered_names, name)
                end
            end
        end
    end

    reload_buffers()
    local names = {}
    for name, id in pairs(state.buffer_ids) do
        table.insert(names,name)
    end
    vim.api.nvim_buf_set_lines(buf,0,-1, false,names)

    -- Open floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        --style = "minimal",
        border = "rounded",
    })


    local group = vim.api.nvim_create_augroup("FloatingBuffers", { clear = true })

    local full_reload = function()
        remove_buffers()
        reload_buffers()
    end

    vim.api.nvim_create_autocmd({'InsertLeave','TextChanged'}, {
        group = group,
        buffer = buf,
        callback = function() full_reload() end,  -- pass function, don't call it
    })


    local close = function()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_hide(state.floating.win)
        end
    end

    vim.keymap.set("n", "q", function()
        close()
    end, { buffer = buf, nowait = true })

    vim.keymap.set("n", "<Esc>", function()
        close()
    end, { buffer = buf, nowait = true })

    vim.keymap.set("n", "<C-c>", function()
        close()
    end, { buffer = buf, nowait = true })


    vim.keymap.set("n", "<CR>", function()
            local word = vim.fn.expand("<cWORD>")
            if state.buffer_ids[word] == nil then
                local new_buf = vim.api.nvim_create_buf(true, false)
                vim.api.nvim_buf_set_name(new_buf,word)

                state.buffer_ids[word] = new_buf
            end
            if not vim.api.nvim_win_is_valid(parent_win) then
                vim.cmd.split()
                parent_win = vim.api.nvim_get_current_win()
                --parent_win = vim.api.nvim_open_win(state.buffer_ids[word],true,{split ='right'})
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
            ordered_names = state.ordered_names,
        })
    else
        vim.api.nvim_win_hide(state.floating.win)
    end
end, {} )

vim.keymap.set('n','<leader>t',function()
    vim.cmd("FloatTerm")
end)
