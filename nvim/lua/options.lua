local opts = {
    number = true,                                                    -- Line numbers
    mouse = 'a',                                                      -- Enable mouse
    ignorecase = true,                                                -- Case insensitive searching UNLESS /C or capital in search
    smartcase = true,                                                 -- Smart case
    hlsearch = false,                                                 -- Highlight search
    wrap = false,                                                     -- Disable line wrap
    breakindent = true,                                               -- Enable break indent
    tabstop = 4,                                                      -- Number of spaces tabs count for
    shiftwidth = 4,                                                   -- Number of spaces to use for auto indent
    expandtab = true,                                                 -- Use spaces instead of tabs
    termguicolors = true,                                             -- Use 24-bit colors
    showmode = false,                                                 -- Don't show mode
    cursorline = true,                                                -- Highlight current line
    relativenumber = true,                                            -- Relative line numbers
    shiftround = true,                                                -- Round indent
    smartindent = true,                                               -- Insert indents automatically
    whichwrap = "b,s,<,>,h,l,[,]",                                    -- Backspace and cursor keys wrap too
    fillchars = { eob = " " },                                        -- Hide ~ at end of buffer
    autowrite = true,                                                 -- Enable auto write
    completeopt = "menu,menuone,noselect",                            -- Set completeopt to have a better completion experience
    conceallevel = 3,                                                 -- Hide * markup for bold and italic
    confirm = false,                                                  -- Confirm to save changes before exiting modified buffer
    formatoptions = "jcroqlnt",                                       -- Auto format options
    grepformat = "%f:%l:%c:%m",                                       -- Add custom `grepformat`
    grepprg = "rg --vimgrep",                                         -- Add custom `grepprg`
    inccommand = "nosplit",                                           -- preview incremental substitute
    laststatus = 0,                                                   -- Disable statusline over
    pumblend = 10,                                                    -- Popup blend
    pumheight = 10,                                                   -- Maximum number of entries in a popup
    scrolloff = 6,                                                    -- Lines of context
    sessionoptions = { "buffers", "curdir", "tabpages", ",winsize" }, -- Add custom `sessionoptions`
    sidescrolloff = 2,                                                -- Columns of context
    signcolumn = "yes",                                               -- Always show the signcolumn, otherwise it would shift the text each time
    spelllang = { "en" },                                             -- Spell checking language
    splitbelow = true,                                                -- Put new windows below current
    splitright = true,                                                -- Put new windows right of current
    timeoutlen = 300,                                                 -- By default timeoutlen is 1000 ms
    undofile = true,                                                  -- Enable persistent undo
    undolevels = 10000,                                               -- Number of undo levels
    wildmode = "longest:full,full",                                   -- Command-line completion mode
}

for k, v in pairs(opts) do
    vim.opt[k] = v
end
