(module obluavim.utils.file.watch
  {autoload {ob-loop obluavim.utils.file.loop
             ob-log obluavim.utils.file.log
             file obluavim.utils.file.init}})

; rename APIs
(def- core vim.fn)
(def- api vim.api)
(def- sys-loop vim.loop)

; FN - Watch the log file of the obl file for changes, returns true when there's a change
(defn log []
  (local log-file (ob-log.get))
  (file.fs:start log-file {}
            (vim.schedule_wrap
              (fn [...] 
                (ob-loop.on-change ...)))))

