local grid = require "hs.grid"

-- Grid config
local gw = 3
local gh = 4
grid.GRIDWIDTH = gw
grid.GRIDHEIGHT = gh
grid.MARGINX = 0
grid.MARGINY = 0

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "left", function()
  resizeWindow(true)
end)

hs.hotkey.bind({"ctrl", "alt", "cmd"}, "right", function()
  resizeWindow(false)
end)

function resizeWindow(left)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local w1 = math.floor(max.w / 3)
  local w2 = math.floor(max.w / 2)
  local w3 = w1 * 2

  if f.w > w3 then
    f.w = w3
  elseif f.w > w2 then
    f.w = w2
  elseif f.w > w1 then
    f.w = w1
  else
    f.w = w3
  end

  if left then
    f.x = max.x
  else
    f.x = max.w - f.w
  end

  win:setFrame(f)
end
