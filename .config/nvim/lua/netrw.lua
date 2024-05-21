local g = vim.g

local options_append = {
    netrw_keepdir = 0,             --Keep the current directory and the browsing directory synced
    netrw_winsize = "17",          -- 17% size
    netrw_banner = "0",            -- hide banner
    netrw_localmkdir = "mkdir -p", -- change mkdir cmd
    netrw_localcopycmd = "cp -r",  -- change copy command
    netrw_localrmdir = "rm -r",    -- change delete command
    netrw_list_hide = [['\(^\|\s\s\)\zs\.\S\+']],
}

for k, v in pairs(options_append) do
    g[k] = v
end
