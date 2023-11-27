local utils = {}

-- mapping function
utils.map = function(lhs, rhs, mode, opts)
    mode = mode or "n"

    if opts then
        options = vim.tbl_extend("force", options, opts)
    end

    vim.keymap.set(lhs, rhs, mode, options)
end

return utils
