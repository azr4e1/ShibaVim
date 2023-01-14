local M = {}

local configure = {
    'css';
    'javascript';
    'html';
}

function M.setup()
    require'nvim-colorizer'.setup(configure)
end

return M
