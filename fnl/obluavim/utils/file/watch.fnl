(module obluavim.utils.file.watch
  {autoload {ob-loop obluavim.utils.file.loop
             ob-log obluavim.utils.file.log
             file obluavim.utils.file.init
             sys obluavim.utils.file.system}})

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; FN - Watch the log file of the obl file for changes, returns true when there's a change
(defn log []
  (let [log-file (ob-log.get)
        file-name (file.name)]
    (if log-file
      (let [path (sys.path! file-name)]
        (tset file.id path {:fs (sys.new!)})
        (sys.start! (. (. file.id path) :fs) (sys.path! log-file) {}
                  (vim.schedule_wrap
                    (fn [...] 
                      (ob-loop.on-change ...)))))
      ;; make sure that the script file we are parsing actually exists
      ;; fixes fzf and telescope temp filenames
      (= (vim.fn.filereadable file-name) 1)
      (tset file.id file-name {:fs "no log found"}))))
