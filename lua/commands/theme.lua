local M = {}

-- Path to storage dir
local storage_dir = vim.fn.stdpath 'config' .. '/lua/storage/'

-- Read file where the current theme is being stored
local function storeThemeToFile(theme)
  local file_path = storage_dir .. 'theme.txt'
  local f = assert(io.open(file_path, 'w+'))
  f:write(theme)
  f:close()
end

-- Toggles the colour theme to light
function M.toggleLightMode()
  vim.o.background = 'light'
  storeThemeToFile 'light'
  print 'Light theme switched on! ☀️ 🏙️'
end

-- Toggles the colour theme to dark
function M.toggleDarkMode()
  vim.o.background = 'dark'
  storeThemeToFile 'dark'
  print 'Dark theme switched on! 🌘 🌃'
end

-- Read the current theme store in theme.txt
function M.readCurrentTheme()
  local file_path = storage_dir .. 'theme.txt'
  local f = assert(io.open(file_path, 'r'))
  local currentTheme = f:read()
  f:close()
  return currentTheme
end

return M
