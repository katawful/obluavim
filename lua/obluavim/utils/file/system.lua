local _2afile_2a = "fnl/obluavim/utils/file/system.fnl"
local _2amodule_name_2a = "obluavim.utils.file.system"
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
local function new_21()
  return vim.loop.new_fs_event()
end
_2amodule_2a["new!"] = new_21
local function start_21(fs, path, flags, callback)
  return vim.loop.fs_event_start(fs, path, flags, callback)
end
_2amodule_2a["start!"] = start_21
local function stop_21(fs)
  return vim.loop.fs_event_stop(fs)
end
_2amodule_2a["stop!"] = stop_21
local function path_21(path)
  return vim.loop.fs_realpath(path, nil)
end
_2amodule_2a["path!"] = path_21
return _2amodule_2a