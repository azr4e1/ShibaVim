local cmp = require'cmp'

local M = {}

M.border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }

--   פּ ﯟ   some other good icons
M.kind_icons = {
    Text = "",
    Method = "m",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
    Unknown = "  "
}

M.format = function(entry, item)

    -- Utils.
    local MAX_LABEL_WIDTH = 50
    local function whitespace(max, len)
        return (" "):rep(max - len)
    end

    -- Limit content width.
    local content = item.abbr
    if #content > MAX_LABEL_WIDTH then
        item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. '…'
    else
        item.abbr = content .. whitespace(MAX_LABEL_WIDTH, #content)
    end

    -- Replace kind with icons.
    item.kind = ' ' .. (M.kind_icons[item.kind] or M.kind_icons.Unknown) .. ' │'

    -- Remove gibberish.
    item.menu = nil
    item.menu = ({
    nvim_lsp = "[LSP]",
    luasnip = "[Snippet]",
    buffer = "[Buffer]",
    path = "[Path]",
    omni = "[Omni]"
    })[entry.source.name]

    return item

end

M.formatting = function()
    local formatting = {
        fields = { "kind", "abbr", "menu" },
        format = M.format
    }

    return formatting
end

M.window = function()
    local window = {
        completion = cmp.config.window.bordered {
            winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = true,
            border = M.border,
            col_offset = -1,
            side_padding = 0
        },
        documentation = cmp.config.window.bordered {
            winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
            scrollbar = true,
            border = M.border,
            side_padding = 1 -- Not working?
        }
    }

    return window
end

return M
