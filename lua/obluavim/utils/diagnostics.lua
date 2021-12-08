local _2afile_2a = "fnl/obluavim/utils/diagnostics.fnl"
local _2amodule_name_2a = "obluavim.utils.diagnostics"
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
local a, buffers, files, s = autoload("obluavim.aniseed.core"), autoload("obluavim.utils.buffer"), autoload("obluavim.utils.file"), autoload("obluavim.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["buffers"] = buffers
_2amodule_locals_2a["files"] = files
_2amodule_locals_2a["s"] = s
local diag = vim.diagnostic
_2amodule_locals_2a["diag"] = diag
local api = vim.api
_2amodule_locals_2a["api"] = api
local function matchDiagnostic(lnum, message)
  local logFileName = files.getLogFile()
  local logFileContents = s.split(a.slurp(logFileName, true), "\n")
  local messagePattern = "%[%w%] Line %d+ (.+)"
  local linePattern = "%[%w%] Line (%d+) .+"
  local quotedPattern = "['\"](%w+)['\"]"
  local message0 = message
  local currentLine = api.nvim_buf_get_lines(0, lnum, (lnum + 1), false)
  local startCol = -1
  local endCol = -1
  local lastLine = 0
  for _, v in pairs(logFileContents) do
    local tempString = s.trim(v)
    tempString = string.gsub(tempString, "\9", " ")
    for matched in tempString:gmatch(linePattern) do
      if (tonumber(matched) == (lnum + 1)) then
        for messageMatched in tempString:gmatch(messagePattern) do
          local foundMatch = false
          if (messageMatched == message0) then
            for quoteMatched in messageMatched:gmatch(quotedPattern) do
              if (foundMatch == true) then break end
              if (lastLine ~= matched) then
                startCol, endCol = string.find(currentLine[1], quoteMatched)
                foundMatch = true
                if (startCol == nil) then
                  startCol = -1
                  endCol = -1
                else
                end
              else
                foundMatch = false
              end
            end
          else
          end
        end
      else
      end
    end
  end
  return (startCol - 1), endCol
end
_2amodule_2a["matchDiagnostic"] = matchDiagnostic
local function genDiagnostics()
  local logFileName = files.getLogFile()
  local logFileContents = s.split(a.slurp(logFileName, true), "\n")
  local matchPattern = "%[(%w)%] Line (%d+) (.+)"
  local severityType = {I = diag.severity.INFO, W = diag.severity.WARN, E = diag.severity.ERROR}
  local groups = {"severity", "lnum", "message"}
  local ns = vim.api.nvim_create_namespace("namespace_name")
  local key = 1
  local diagOutput = {}
  for _, v in pairs(logFileContents) do
    local tempString = s.trim(v)
    tempString = string.gsub(tempString, "\9", " ")
    if ((tempString == "") or (tempString == nil)) then
      break
    else
    end
    diagOutput[key] = diag.match(tempString, matchPattern, groups, severityType)
    do end (diagOutput)[key]["source"] = "Construction Set ScriptSync"
    local startCol, endCol = matchDiagnostic(diagOutput[key].lnum, diagOutput[key].message)
    if (startCol >= 0) then
      diagOutput[key]["col"] = startCol
      diagOutput[key]["end_col"] = endCol
    else
    end
    key = (key + 1)
  end
  return diag.set(ns, 0, diagOutput, {})
end
_2amodule_2a["genDiagnostics"] = genDiagnostics