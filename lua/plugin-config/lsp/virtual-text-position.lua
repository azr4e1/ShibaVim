-- Location information about the last message printed. The format is
-- `(did print, buffer number, line number)`.
local last_echo = { false, -1, -1 }

-- The timer used for displaying a diagnostic in the commandline.
local echo_timer = nil

-- The timer after which to display a diagnostic in the commandline.
local echo_timeout = 50

-- The highlight group to use for warning messages.
local warning_hlgroup = 'DiagnosticSignWarn'

-- The highlight group to use for error messages.
local error_hlgroup = 'DiagnosticSignError'

-- The highlight group to use for error messages.
local hint_hlgroup = 'DiagnosticSignHint'

-- The highlight group to use for error messages.
local info_hlgroup = 'DiagnosticSignInfo'

-- If the first diagnostic line has fewer than this many characters, also add
-- the second line to it.
local short_line_limit = 20

-- Prints the first diagnostic for the current line.
function Echo_diagnostic()
  if echo_timer then
    echo_timer:stop()
  end

  echo_timer = vim.defer_fn(
    function()
      local line = vim.fn.line('.') - 1
      local bufnr = vim.api.nvim_win_get_buf(0)

      if last_echo[1] and last_echo[2] == bufnr and last_echo[3] == line then
        return
      end

      local diags = vim
        .lsp
        .diagnostic
        .get_line_diagnostics(bufnr, line, { severity_limit = 'Info' })

      if #diags == 0 then
        -- If we previously echo'd a message, clear it out by echoing an empty
        -- message.
        if last_echo[1] then
          last_echo = { false, -1, -1 }

          vim.api.nvim_command('echo ""')
        end

        return
      end

      last_echo = { true, bufnr, line }

      local diag = diags[1]
      local AVOID_PRESS_ENTER_CHARS = 17
      local width = vim.api.nvim_get_option('columns') - AVOID_PRESS_ENTER_CHARS
      local lines = vim.split(diag.message, "\n")
      local message = lines[1]

      local line_number = 2
      while line_number < #lines and #message <= width do
        message = message .. ' ' .. lines[line_number]
        line_number = line_number + 1
      end

      if width > 0 and #message >= width then
        message = message:sub(1, width - #"warning: ") .. '…'
      end

      local kind = 'warning'
      local hlgroup = warning_hlgroup

      if diag.severity == vim.lsp.protocol.DiagnosticSeverity.Error then
        kind = 'error'
        hlgroup = error_hlgroup
      elseif diag.severity == vim.lsp.protocol.DiagnosticSeverity.Hint then
        kind = 'hint'
        hlgroup = hint_hlgroup
      elseif diag.severity == vim.lsp.protocol.DiagnosticSeverity.Information then
        kind = 'info'
        hlgroup = info_hlgroup
      end

      local chunks = {
        { kind .. ': ', hlgroup },
        { message }
      }

      vim.api.nvim_echo(chunks, false, {})
    end,
    echo_timeout
  )
end

vim.cmd[[autocmd CursorMoved * :lua Echo_diagnostic()]]

