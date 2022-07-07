local _2afile_2a = "fnl/obluavim/utils/file/watch.fnl"
local _2amodule_name_2a = "obluavim.utils.file.watch"
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
local autoload = (require("aniseed.autoload")).autoload
local file, ob_log, ob_loop = autoload("obluavim.utils.file.init"), autoload("obluavim.utils.file.log"), autoload("obluavim.utils.file.loop")
do end (_2amodule_locals_2a)["file"] = file
_2amodule_locals_2a["ob-log"] = ob_log
_2amodule_locals_2a["ob-loop"] = ob_loop
local core = vim.fn
_2amodule_locals_2a["core"] = core
local api = vim.api
_2amodule_locals_2a["api"] = api
local sys_loop = vim.loop
_2amodule_locals_2a["sys-loop"] = sys_loop
local function log()
  local log_file = ob_log.get()
  local function _1_(...)
    return ob_loop["on-change"](...)
  end
  return (file.fs):start(log_file, {}, vim.schedule_wrap(_1_))
end
_2amodule_2a["log"] = log
return _2amodule_2a