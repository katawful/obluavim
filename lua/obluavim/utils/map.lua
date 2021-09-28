local _2afile_2a = "fnl/obluavim/utils/map.fnl"
local _1_
do
  local name_4_auto = "obluavim.utils.map"
  local module_5_auto
  do
    local x_6_auto = _G.package.loaded[name_4_auto]
    if ("table" == type(x_6_auto)) then
      module_5_auto = x_6_auto
    else
      module_5_auto = {}
    end
  end
  module_5_auto["aniseed/module"] = name_4_auto
  module_5_auto["aniseed/locals"] = ((module_5_auto)["aniseed/locals"] or {})
  do end (module_5_auto)["aniseed/local-fns"] = ((module_5_auto)["aniseed/local-fns"] or {})
  do end (_G.package.loaded)[name_4_auto] = module_5_auto
  _1_ = module_5_auto
end
local autoload
local function _3_(...)
  return (require("obluavim.aniseed.autoload")).autoload(...)
end
autoload = _3_
local function _6_(...)
  local ok_3f_21_auto, val_22_auto = nil, nil
  local function _5_()
    return {}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {["require-macros"] = {["obluavim.utils.macros"] = true}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local _2amodule_2a = _1_
local _2amodule_name_2a = "obluavim.utils.map"
do local _ = ({nil, _1_, nil, {{nil}, nil, nil, nil}})[2] end
local core
do
  local v_23_auto = vim.fn
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["core"] = v_23_auto
  core = v_23_auto
end
local createMap
do
  local v_23_auto
  do
    local v_25_auto
    local function createMap0(mode, lhs, rhs, ...)
      local mode0 = tostring(mode)
      local lhs0 = tostring(lhs)
      local rhs0 = tostring(rhs)
      if ((core.hasmapto(rhs0, mode0) == 0) and (core.empty(core.maparg(lhs0, mode0)) > 0)) then
        local _8_ = mode0
        if (_8_ == "n") then
          return vim.api.nvim_buf_set_keymap(0, "n", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
        elseif (_8_ == "v") then
          return vim.api.nvim_buf_set_keymap(0, "v", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
        elseif (_8_ == "i") then
          return vim.api.nvim_buf_set_keymap(0, "i", lhs0, rhs0, {noremap = false, nowait = true, silent = true})
        end
      end
    end
    v_25_auto = createMap0
    _1_["createMap"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["createMap"] = v_23_auto
  createMap = v_23_auto
end
return nil