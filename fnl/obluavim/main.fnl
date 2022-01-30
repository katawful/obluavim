(module obluavim.main
        {require-macros [obluavim.utils.macros]
         autoload {maps obluavim.utils.map
                   files obluavim.utils.file
                   }
         })

; Remap vim.g and others to something a touch more sensible
(def- g vim.g)

; Define global variables here:
(set g.obluavimFileExt {1 :obl
                        2 :oblivion
                        })

(defn init []
  (command- ObluavimShowLog {:nargs 0
                             :buffer true
                             } "lua require('obluavim.utils.diagnostics').genDiagnostics()")
  ; show map default log
  (maps.createMap :n :<LocalLeader>s :<CMD>ObluavimShowLog<CR>)
  (files.getLogFile))
