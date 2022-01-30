(module obluavim.utils.file)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; FN - Truncate the filename of the current file
; $output - returns truncated filename
(defn shortenFilename []
  (local output (core.expand "%:~:."))
  output)

; FN - Get the log file of the current file
; $output - returns log file of the current filename
(defn getLogFile []
  (local fileName (shortenFilename))
  (local regexObject :%w+$)
  ; sub the extension with the log file extension
  (local output (: fileName :gsub (fileName:match regexObject) :log))
  output)
