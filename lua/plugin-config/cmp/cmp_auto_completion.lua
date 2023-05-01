local cmp = require'cmp'
local luasnip = require'luasnip'
local u = require'plugin-config.cmp.utils'
local ui = require'plugin-config.cmp.ui'
require("luasnip.loaders.from_vscode").lazy_load()

local M = {}

function M.setup()
    cmp.setup {
        completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged },
            completeopt='menu,menuone,noinsert,noselect'
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<ESC>"] = cmp.mapping {
                i = u.esc_auto,
                c = function()
                    if cmp.visible() then
                        cmp.abort()
                    else
                        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-c>', true, true, true), 'n', true)
                    end
                end
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            -- ["<CR>"] = cmp.mapping.confirm { select = false },
            ["<CR>"] = cmp.mapping {
                i = cmp.mapping.confirm { select = false },
                c = u.cmdline_cr_auto()
            },
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expandable() then
                    luasnip.expand()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif u.check_backspace() then
                    fallback()
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
        formatting = ui.formatting(),
        sources = {
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "luasnip" },
            { name = "buffer" },
            { name = "path" },
        },
        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },
        window = ui.window(),
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
            { name = 'omni' },
            { name = 'path' },
            { name = 'buffer' },
        }
    })
end

return M
