(module obluavim.utils.file.log
  {autoload {file obluavim.utils.file.init}})

; FN - Get the log file name of the current file
; $output - returns log file name of the current filename
(defn get []
  (local fileName (file.short-name))
  (local regexObject :%w+$)
  ; sub the extension with the log file extension
  (local output (: fileName :gsub (fileName:match regexObject) :log))
  output)

