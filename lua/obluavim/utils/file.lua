local _2afile_2a = "fnl/obluavim/utils/file.fnl"
local _2amodule_name_2a = "obluavim.utils.file"
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
local function shortenFilename()
  local output = core.expand("%:~:.")
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["shortenFilename"] = shortenFilename
local function getLogFile()
  local fileName = shortenFilename()
  do end (_2amodule_locals_2a)["fileName"] = fileName
  local regexObject = "%w+$"
  _2amodule_locals_2a["regexObject"] = regexObject
  local output = fileName:gsub(fileName:match(regexObject), "log")
  do end (_2amodule_locals_2a)["output"] = output
  return output
end
_2amodule_2a["getLogFile"] = getLogFile