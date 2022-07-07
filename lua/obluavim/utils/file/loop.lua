local _2afile_2a = "fnl/obluavim/utils/file/loop.fnl"
local _2amodule_name_2a = "obluavim.utils.file.loop"
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
local diag, file, watch = autoload("obluavim.utils.diagnostics.init"), autoload("obluavim.utils.file.init"), autoload("obluavim.utils.file.watch")
do end (_2amodule_locals_2a)["diag"] = diag
_2amodule_locals_2a["file"] = file
_2amodule_locals_2a["watch"] = watch
local function on_change(...)
  diag.generate()
  do end (file.fs):stop()
  return watch.log()
end
_2amodule_2a["on-change"] = on_change
return _2amodule_2a