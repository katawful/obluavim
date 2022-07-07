(module obluavim.utils.file.log
  {autoload {file obluavim.utils.file.init}})

; FN - Get the log file name of the current file
; $ - returns log file name of the current filename
(defn get []
  (let [file-name (file.short-name)]
    ; sub the extension with the log file extension
    (file-name:gsub (.. "%." (file.extension)) :.log)))
