(module obluavim.utils.file.loop
        {autoload {watch obluavim.utils.file.watch
                   file obluavim.utils.file.init
                   sys obluavim.utils.file.system
                   diag obluavim.utils.diagnostics.init}})

;; Loop
; This modules handles callbacks for vim.loop

; FN - manage log file changes
(defn on-change [...] (diag.generate)
      (let [path (sys.path! (file.name))]
        (sys.stop! (. (. file.id path) :fs))) (watch.log))
