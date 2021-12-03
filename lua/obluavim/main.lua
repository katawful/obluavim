local _2afile_2a = "fnl/obluavim/main.fnl"
local _2amodule_name_2a = "obluavim.main"
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
local files, maps, _ = autoload("obluavim.utils.file"), autoload("obluavim.utils.map"), nil
_2amodule_locals_2a["files"] = files
_2amodule_locals_2a["maps"] = maps
_2amodule_locals_2a["_"] = _
local g = vim.g
_2amodule_locals_2a["g"] = g
g.obluavimFileExt = {"obl", "oblivion"}
local function init()
  do
    vim.api.nvim_command("command! -nargs=0 -buffer ObluavimShowLog lua require('obluavim.utils.buffer').openLogWindow()")
  end
  maps.createMap("n", "<LocalLeader>s", "<CMD>ObluavimShowLog<CR>")
  return files.getLogFile()
end
_2amodule_2a["init"] = init