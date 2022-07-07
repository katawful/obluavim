local _2afile_2a = "fnl/obluavim/utils/file/init.fnl"
local _2amodule_name_2a = "obluavim.utils.file.init"
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
local sys_loop = vim.loop
_2amodule_locals_2a["sys-loop"] = sys_loop
local fs = vim.loop.new_fs_event()
do end (_2amodule_2a)["fs"] = fs
local function short_name()
  local output = core.expand("%:~:.")
  return output
end
_2amodule_2a["short-name"] = short_name
local function extension()
  return core.expand("%:e")
end
_2amodule_2a["extension"] = extension
return _2amodule_2a