(module obluavim.utils.file.loop
  {autoload {watch obluavim.utils.file.watch
             file obluavim.utils.file.init
             diag obluavim.utils.diagnostics.init}})

;; Loop
; This modules handles callbacks for vim.loop

; FN - manage log file changes
(defn on-change [...]
  (diag.generate)
  (file.fs:stop)
  (watch.log))
