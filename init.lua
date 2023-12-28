require("ab.settings")
require("ab.keybinds")
require("ab.plugins")

function _G.dump(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end
