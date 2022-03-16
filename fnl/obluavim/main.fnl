(module obluavim.main
        {require-macros [obluavim.utils.macros]
         autoload {map obluavim.utils.map
                   file obluavim.utils.file.init
                   watch obluavim.utils.file.watch
                   diag obluavim.utils.diagnostics.init}})

; Remap vim.g and others to something a touch more sensible
(def- g vim.g)

; Define global variables here:
(set g.obluavimFileExt {1 :obl
                        2 :oblivion})

(defn init []
  (command- ObluavimGenDiags {:nargs 0
                                   :buffer true}
                            "lua require('obluavim.utils.diagnostics.init').generate()")
  ; show map default log
  (map.create :n :<LocalLeader>s :<CMD>ObluavimGenDiags<CR>)
  (diag.generate)
  (watch.log))
