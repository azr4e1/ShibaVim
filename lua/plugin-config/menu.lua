local ToggleAutoCompletion = function()
    if require'cmp'.get_config().completion.autocomplete ~= false then
        vim.cmd'nnoremenu <silent> PopUp.Disable\\ Autocompletion :CompletionManual<CR>'
        vim.cmd'vnoremenu <silent> PopUp.Disable\\ Autocompletion :<C-u>CompletionManual<CR>'
        vim.cmd'inoremenu <silent> PopUp.Disable\\ Autocompletion <C-o>:CompletionManual<CR>'
    else
        vim.cmd'nnoremenu <silent> PopUp.Enable\\ Autocompletion :CompletionAuto<CR>'
        vim.cmd'vnoremenu <silent> PopUp.Enable\\ Autocompletion :<C-u>CompletionAuto<CR>'
        vim.cmd'inoremenu <silent> PopUp.Enable\\ Autocompletion <C-o>:CompletionAuto<CR>'
    end
end

local LspEntries = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
        vim.cmd'nnoremenu <silent> PopUp.Toggle\\ Virtual\\ Text :Virtual<CR>'
        vim.cmd'inoremenu <silent> PopUp.Toggle\\ Virtual\\ Text <C-o>:Virtual<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Toggle\\ Diagnostics :Diagnostics<CR>'
        vim.cmd'inoremenu <silent> PopUp.Toggle\\ Diagnostics <C-o>:Diagnostics<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Code\\ Actions :lua vim.lsp.buf.code_action()<CR>'
        vim.cmd'vnoremenu <silent> PopUp.Code\\ Actions :lua vim.lsp.buf.code_action()<CR>'
        vim.cmd'inoremenu <silent> PopUp.Code\\ Actions <C-o>:lua vim.lsp.buf.code_action()<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Search\\ References :lua vim.lsp.buf.references()<CR>'
        vim.cmd'inoremenu <silent> PopUp.Search\\ References <C-o>:lua vim.lsp.buf.references()<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Go\\ To\\ Definition :lua vim.lsp.buf.definition()<CR>'
        vim.cmd'inoremenu <silent> PopUp.Go\\ To\\ Definition <C-o>:lua vim.lsp.buf.definition()<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Object\\ Information :lua vim.lsp.buf.hover()<CR>'
        vim.cmd'inoremenu <silent> PopUp.Object\\ Information <C-o>:lua vim.lsp.buf.hover()<CR>'
        vim.cmd'nnoremenu <silent> PopUp.Rename\\ Object :lua vim.lsp.buf.rename()<CR>'
        vim.cmd'nnoremenu <silent> PopUp.-4- <Nop>'
        vim.cmd'inoremenu <silent> PopUp.-4- <Nop>'
        vim.cmd'vnoremenu <silent> PopUp.-4- <Nop>'
    end
end

local M = {}
function M.setup()
    vim.cmd'aunmenu PopUp'
    vim.cmd'vnoremenu <silent> PopUp.Cut "+x'
    vim.cmd'vnoremenu <silent> PopUp.Copy "+y'
    vim.cmd'anoremenu <silent> PopUp.Paste "+gP'
    vim.cmd'vnoremenu <silent> PopUp.Paste "+P'
    vim.cmd'vnoremenu <silent> PopUp.Delete "_x'
    vim.cmd'nnoremenu <silent> PopUp.Select\\ All ggVG'
    vim.cmd'vnoremenu <silent> PopUp.Select\\ All gg0oG$'
    vim.cmd'inoremenu <silent> PopUp.Select\\ All <C-Home><C-O>VG'
    vim.cmd'nnoremenu <silent> PopUp.-3- <Nop>'
    vim.cmd'inoremenu <silent> PopUp.-3- <Nop>'
    vim.cmd'vnoremenu <silent> PopUp.-3- <Nop>'
    vim.cmd'noremenu <silent> PopUp.Save :w<CR>'
    vim.cmd'inoremenu <silent> PopUp.Save <C-o>:w<CR>'
    vim.cmd'noremenu <silent> PopUp.Quit :<C-u>q<CR>'
    vim.cmd'inoremenu <silent> PopUp.Quit <C-o>:<C-u>q<CR>'
    vim.cmd'noremenu <silent> PopUp.Quit\\ All :<C-u>qa<CR>'
    vim.cmd'inoremenu <silent> PopUp.Quit\\ All <C-o>:<C-u>qa<CR>'
    -- vim.cmd'nnoremenu <silent> PopUp.-1- <Nop>'
    -- vim.cmd'inoremenu <silent> PopUp.-1- <Nop>'
    -- vim.cmd'vnoremenu <silent> PopUp.-1- <Nop>'
    -- vim.cmd'nnoremenu <silent> PopUp.Toggle\\ Indentline :IndentBlanklineToggle!<CR>'
    -- vim.cmd'inoremenu <silent> PopUp.Toggle\\ Indentline <C-o>:IndentBlanklineToggle!<CR>'
    -- ToggleAutoCompletion()
    vim.cmd'nnoremenu <silent> PopUp.-2- <Nop>'
    vim.cmd'inoremenu <silent> PopUp.-2- <Nop>'
    vim.cmd'vnoremenu <silent> PopUp.-2- <Nop>'
    LspEntries()
    vim.cmd'nnoremenu <silent> PopUp.Launch/Toggle\\ REPL :call ToggleTerm()<CR>'
    vim.cmd'inoremenu <silent> PopUp.Launch/Toggle\\ REPL <C-o>:call ToggleTerm()<CR>'
    vim.cmd'nnoremenu <silent> PopUp.Kill\\ REPL :call KillTerm()<CR>'
    vim.cmd'inoremenu <silent> PopUp.Kill\\ REPL <C-o>:call KillTerm()<CR>'
    vim.cmd'nnoremenu <silent> PopUp.Send\\ to\\ REPL :call DownLine()<CR>'
    vim.cmd'inoremenu <silent> PopUp.Send\\ to\\ REPL <C-o>:call DownLine()<CR>'
    vim.cmd'vnoremenu <silent> PopUp.Send\\ to\\ REPL :call DownSelection()<CR>'
end

return M
