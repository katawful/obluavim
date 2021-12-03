local _2afile_2a = "fnl/obluavim/utils/buffer.fnl"
local _2amodule_name_2a = "obluavim.utils.buffer"
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
local a, files, s = autoload("obluavim.aniseed.core"), autoload("obluavim.utils.file"), autoload("obluavim.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["files"] = files
_2amodule_locals_2a["s"] = s
local core = vim.fn
_2amodule_locals_2a["core"] = core
local api = vim.api
_2amodule_locals_2a["api"] = api
local function modifyLogContents(export, widthHeight)
  local logFileName = files.getLogFile()
  local logFileContents = s.split(a.slurp(logFileName, true), "\n")
  local logFile = {}
  local logHeight = ""
  local logWidth = 0
  for key, value in pairs(logFileContents) do
    if (value == "") then
      break
    else
    end
    local tempString = s.trim(value)
    tempString = string.gsub(tempString, "\9", " ")
    logHeight = key
    local tempWidth = #value
    if (tempWidth > logWidth) then
      logWidth = tempWidth
    else
    end
    logFile[key] = tempString
  end
  local _3_ = export
  if (_3_ == false) then
    return logFile
  elseif (_3_ == true) then
    local _4_ = widthHeight
    if (_4_ == "width") then
      return logWidth
    elseif (_4_ == "height") then
      return logHeight
    else
      return nil
    end
  else
    return nil
  end
end
local function createLogBuffer()
  local logFileName = files.getLogFile()
  local logName = modifyLogContents(false, "nil")
  if (core.bufexists(logFileName) == 0) then
    local logBuffer = api.nvim_create_buf(false, true)
    do end (_2amodule_2a)["logBuffer"] = logBuffer
    print("buf id is: ", logBuffer)
    api.nvim_buf_set_lines(logBuffer, 0, -1, false, logFileContents)
    return logBuffer
  else
    return api.nvim_err_writeln("no log file")
  end
end
_2amodule_2a["createLogBuffer"] = createLogBuffer
local function openLogWindow()
  local winOpts = {relative = "cursor", width = modifyLogContents(true, "width"), height = modifyLogContents(true, "height"), row = 1, col = 1, style = "minimal", border = "shadow"}
  _2amodule_locals_2a["winOpts"] = winOpts
  local localBuffer = createLogBuffer()
  do end (_2amodule_locals_2a)["localBuffer"] = localBuffer
  local localWindow = api.nvim_open_win(localBuffer, true, winOpts)
  do end (_2amodule_2a)["localWindow"] = localWindow
end
_2amodule_2a["openLogWindow"] = openLogWindow