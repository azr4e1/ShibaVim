local M = {}

local config = function ()
    local home = os.getenv("HOME")
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    local handle = io.popen('fortune')
    dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    }
    dashboard.section.buttons.val = {
        dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
        dashboard.button( "SPC f h", "  Recently opened files" , ":Telescope oldfiles<CR>"),
        dashboard.button("SPC f f", "  Find file", ":Telescope find_files find_command=rg,--hidden,--files<CR>"),
        dashboard.button( "SPC f w", "  Find word" , ":Telescope live_grep<CR>"),
        dashboard.button( "SPC f p", "  Project Browser" , ':Telescope find_files cwd=' .. home .. '/Desktop/Projects<CR>'),
        dashboard.button( "SPC f s", "  Open Personal Scripts" , ':Telescope find_files cwd=' .. home .. '/.scripts<CR>'),
        dashboard.button( "SPC w s", "  Open Personal Wikis" , ":lua require'plugins.wiki-picker'.wiki_picker()<CR>"),
        dashboard.button( "q", "  Quit NVIM" , ":qa<CR>"),
    }
    local fortune = handle:read("*a")
    handle:close()
    dashboard.section.footer.val = fortune

    dashboard.config.opts.noautocmd = true

    alpha.setup(dashboard.config)
end

function M.setup()
    config()
end

return M
