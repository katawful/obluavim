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
local diag, file, map, watch, _ = autoload("obluavim.utils.diagnostics.init"), autoload("obluavim.utils.file.init"), autoload("obluavim.utils.map"), autoload("obluavim.utils.file.watch"), nil
_2amodule_locals_2a["diag"] = diag
_2amodule_locals_2a["file"] = file
_2amodule_locals_2a["map"] = map
_2amodule_locals_2a["watch"] = watch
_2amodule_locals_2a["_"] = _
local g = vim.g
_2amodule_locals_2a["g"] = g
g.obluavimFileExt = {"obl", "oblivion"}
local function init()
  do
    vim.api.nvim_command("command! -nargs=0 -buffer ObluavimGenDiags lua require('obluavim.utils.diagnostics.init').generate()")
  end
  map.create("n", "<LocalLeader>s", "<CMD>ObluavimGenDiags<CR>")
  diag.generate()
  return watch.log()
end
_2amodule_2a["init"] = init
return _2amodule_2a