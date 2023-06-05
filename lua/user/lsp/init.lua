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

  -- Kiểm tra loại file (ví dụ: Python, Lua, ...)
  local file_type = vim.bo.filetype

  -- Định nghĩa các lệnh chạy code cho từng loại file
  if file_type == "python" then
    -- Chạy code Python
    vim.cmd("!python3 " .. file_path)
  elseif file_type == "lua" then
    -- Chạy code Lua
    vim.cmd("!lua " .. file_path)
  else
    -- Thêm các lệnh chạy code cho các loại file khác
  end
end

-- Đặt phím tắt cho macro script
vim.api.nvim_set_keymap("n", "<Leader>r", ":lua RunCodeInFile()<CR>", { noremap = true, silent = true })


require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
