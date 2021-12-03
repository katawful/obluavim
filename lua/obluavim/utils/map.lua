local _2afile_2a = "fnl/obluavim/utils/map.fnl"
local _2amodule_name_2a = "obluavim.utils.map"
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
local _ = nil
_2amodule_locals_2a["_"] = _
local core = vim.fn
_2amodule_locals_2a["core"] = core
local function createMap(mode, lhs, rhs, ...)
  local mode0 = tostring(mode)
  local lhs0 = lhs
  local rhs0 = rhs
  if ((core.hasmapto(rhs0, mode0) == 0) and (core.empty(core.maparg(lhs0, mode0)) > 0)) then
    local _1_ = mode0
    if (_1_ == "n") then
      return vim.api.nvim_buf_set_keymap(0, "n", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
    elseif (_1_ == "v") then
      return vim.api.nvim_buf_set_keymap(0, "v", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
    elseif (_1_ == "i") then
      return vim.api.nvim_buf_set_keymap(0, "i", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_2a["createMap"] = createMap
local function createMapForce(mode, lhs, rhs, ...)
  local mode0 = tostring(mode)
  local lhs0 = lhs
  local rhs0 = rhs
  local _4_ = mode0
  if (_4_ == "n") then
    return vim.api.nvim_buf_set_keymap(0, "n", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
  elseif (_4_ == "v") then
    return vim.api.nvim_buf_set_keymap(0, "v", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
  elseif (_4_ == "i") then
    return vim.api.nvim_buf_set_keymap(0, "i", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
  else
    return nil
  end
end
_2amodule_2a["createMapForce"] = createMapForce