local _2afile_2a = "fnl/obluavim/utils/file/log.fnl"
local _2amodule_name_2a = "obluavim.utils.file.log"
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
local autoload = (require("obluavim.aniseed.autoload")).autoload
local file = autoload("obluavim.utils.file.init")
do end (_2amodule_locals_2a)["file"] = file
local function get()
  local file_name = file.name()
  local log_file = file_name:gsub(("%." .. file.extension()), ".log")
  if (vim.fn.filereadable(log_file) == 1) then
    return log_file
  else
    return nil
  end
end
_2amodule_2a["get"] = get
return _2amodule_2a