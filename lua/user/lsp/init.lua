local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- Định nghĩa macro script
function RunCodeInFile()
  -- Lưu file hiện tại
  vim.cmd("w")

  -- Lấy đường dẫn của file hiện tại
  local file_path = vim.fn.expand("%:p")

  -- Kiểm tra loại file (ví dụ: Python, Lua, HTML, ...)
  local file_type = vim.bo.filetype

  -- Định nghĩa các lệnh chạy code cho từng loại file
  if file_type == "python" then
    -- Chạy code Python
    vim.cmd("!python3 " .. file_path)
  elseif file_type == "lua" then
    -- Chạy code Lua
    vim.cmd("!lua " .. file_path)
  elseif file_type == "html" then
    -- Kiểm tra trạng thái của trang web
    local web_open = false

    -- Thử tìm trình duyệt mở trang web đã tồn tại
    if vim.fn.executable("msedge") == 1 then
      local tabs = vim.fn.systemlist("powershell.exe -Command \"(New-Object -ComObject 'Shell.Application').Windows() | Where-Object { $_.Name -like '*Edge*' } | Select-Object -ExpandProperty LocationURL\"")
      for _, tab in ipairs(tabs) do
        if tab == "file:///" .. file_path then
          web_open = true
          break
        end
      end
    end

    -- Nếu trang web đã mở, thực hiện refresh
    if web_open then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<F5>", true, true, true), "n", true)
    else
      -- Mở trang web trong Microsoft Edge
      vim.cmd("!start msedge \"" .. file_path .. "\"")
    end
  else
    -- Thêm các lệnh chạy code cho các loại file khác
  end
end

-- Đặt phím tắt cho macro script
vim.api.nvim_set_keymap("n", "<Leader>r", "<Cmd>lua RunCodeInFile()<CR>", { noremap = true, silent = true })

require("user.lsp.mason")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")

