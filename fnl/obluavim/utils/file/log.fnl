(module obluavim.utils.file.log {autoload {file obluavim.utils.file.init}})

;; FN - Get the log file name of the current file
;; $ - returns log file name of the current filename
;; Note that this does not call any vim.loop stuff
;; This is technically invalid
(defn get [] (let [file-name (file.name)
                   log-file (file-name:gsub (.. "%." (file.extension)) :.log)]
               (if (= (vim.fn.filereadable log-file) 1)
                   log-file
                   nil)))
