local _2afile_2a = "fnl/obluavim/utils/file.fnl"
local _1_
do
  local name_4_auto = "obluavim.utils.file"
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
    _1_["aniseed/local-fns"] = {}
    return val_22_auto
  else
    return print(val_22_auto)
  end
end
local _local_4_ = _6_(...)
local _2amodule_2a = _1_
local _2amodule_name_2a = "obluavim.utils.file"
do local _ = ({nil, _1_, nil, {{}, nil, nil, nil}})[2] end
local core
do
  local v_23_auto = vim.fn
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["core"] = v_23_auto
  core = v_23_auto
end
local api
do
  local v_23_auto = vim.api
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["api"] = v_23_auto
  api = v_23_auto
end
local getBufferName
do
  local v_23_auto
  do
    local v_25_auto
    local function getBufferName0()
      local bufName = api.nvim_buf_get_name(0)
      return bufName
    end
    v_25_auto = getBufferName0
    _1_["getBufferName"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["getBufferName"] = v_23_auto
  getBufferName = v_23_auto
end
local shortenFilename
do
  local v_23_auto
  do
    local v_25_auto
    local function shortenFilename0()
      local fileName = getBufferName()
      local fileNameRegex = "%w+%.%w+$"
      local output
      do
        local v_23_auto0
        do
          local v_25_auto0 = fileName:match(fileNameRegex)
          do end (_1_)["output"] = v_25_auto0
          v_23_auto0 = v_25_auto0
        end
        local t_24_auto = (_1_)["aniseed/locals"]
        t_24_auto["output"] = v_23_auto0
        output = v_23_auto0
      end
      return output
    end
    v_25_auto = shortenFilename0
    _1_["shortenFilename"] = v_25_auto
    v_23_auto = v_25_auto
  end
  local t_24_auto = (_1_)["aniseed/locals"]
  t_24_auto["shortenFilename"] = v_23_auto
  shortenFilename = v_23_auto
end
return nil