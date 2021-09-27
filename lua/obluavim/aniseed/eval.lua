local _2afile_2a = "fnl/aniseed/eval.fnl"
local _1_
do
  local name_4_auto = "obluavim.aniseed.eval"
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
    return {autoload("obluavim.aniseed.core"), autoload("obluavim.aniseed.compile"), autoload("obluavim.aniseed.fennel"), autoload("obluavim.aniseed.fs"), autoload("obluavim.aniseed.nvim")}
  end
  ok_3f_21_auto, val_22_auto = pcall(_5_)
  if ok_3f_21_auto then
    _1_["aniseed/local-fns"] = {autoload = {a = "obluavim.aniseed.core", compile = "obluavim.aniseed.compile", fennel = "obluavim.aniseed.fennel", fs = "obluavim.aniseed.fs", nvim = "obluavim.aniseed.nvim"}}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local a = _local_4_[1]
local compile = _local_4_[2]
local fennel = _local_4_[3]
local fs = _local_4_[4]
local nvim = _local_4_[5]
local _2amodule_2a = _1_
local _2amodule_name_2a = "obluavim.aniseed.eval"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local str
do
  local v_23_auto
  do
    local v_25_auto
    local function str0(code, opts)
      local fnl = fennel.impl()
      local function _8_()
        return fnl.eval(compile["macros-prefix"](code, opts), a.merge({["compiler-env"] = _G}, opts))
      end
      return xpcall(_8_, fnl.traceback)
    end
    v_25_auto = str0
    _1_["str"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["str"] = v_23_auto
  str = v_23_auto
end
return nil
