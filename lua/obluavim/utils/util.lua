local _2afile_2a = "fnl/obluavim/utils/util.fnl"
local _2amodule_name_2a = "obluavim.utils.util"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local core = vim.fn
_2amodule_locals_2a["core"] = core
local api = vim.api
_2amodule_locals_2a["api"] = api
local function capFloatWidth(inputWidth)
  local winWidth = api.nvim_win_get_width(0)
  local outputWidth = inputWidth
  if (inputWidth >= winWidth) then
    outputWidth = (winWidth - 2)
  else
  end
  return outputWidth
end
_2amodule_2a["capFloatWidth"] = capFloatWidth
local function capFloatHeight(inputHeight)
  local winHeight = api.nvim_win_get_height(0)
  local outputHeight = inputHeight
  if (inputHeight >= winHeight) then
    outputHeight = (winHeight - 2)
  else
  end
  return outputHeight
end
_2amodule_2a["capFloatHeight"] = capFloatHeight
return _2amodule_2a