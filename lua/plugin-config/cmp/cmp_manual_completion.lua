local cmp = require'cmp'
local luasnip = require'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()

local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local abort = function()
    cmp.abort()
    cmp.core:reset()
end

local abort_or_close = function()
    if cmp.visible() then
        abort()
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
    end
end

local cmdline_cr = function()
    if cmp.visible() then
        cmp.confirm({select=false})
    else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, true, true), 'n', true)
    end
end

--   פּ ﯟ   some other good icons
local kind_icons = {
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
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

local M = {}

function M.setup()
    cmp.setup {
        completion = {
            autocomplete = false,
            completeopt='menu'
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<ESC>"] = cmp.mapping(abort_or_close, {"i", "c"}),
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            -- ["<CR>"] = cmp.mapping.confirm { select = false },
            ["<CR>"] = cmp.mapping {
                i = cmp.mapping.confirm { select = false },
                c = cmdline_cr
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif not check_backspace() then
                    cmp.complete()
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, {
                "i",
                "s",
            }),
        },
        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
                -- Kind icons
                vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
                vim_item.menu = ({
                    nvim_lsp = "[LSP]",
                    luasnip = "[Snippet]",
                    buffer = "[Buffer]",
                    path = "[Path]",
                    omni = "[Omni]"
                })[entry.source.name]
                return vim_item
            end,
        },
        sources = {
            { name = "nvim_lsp", priority = 1000 },
            { name = "nvim_lua", priority = 1000 },
            { name = "luasnip", priority = 750 },
            { name = "buffer", priority = 500 },
            { name = "path", priority = 250 },
            -- { name = 'nvim_lsp_signature_help' },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = {
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
        },
        experimental = {
            ghost_text = true,
            native_menu = false,
        },
    }

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

        -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' }
          }
        }
      })
    })

    cmp.setup.filetype({'markdown', 'text'}, {
        sources = {
            { name = 'path' },
            { name = 'buffer' },
        }
    })

    cmp.setup.filetype({'vimwiki'}, {
        sources = {
            { name = 'path' },
            { name = 'buffer' },
            { name = 'omni' },
        }
    })
end

return M
