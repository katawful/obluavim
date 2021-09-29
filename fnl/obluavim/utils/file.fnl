(module obluavim.utils.file)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; Truncate full file path to just filename from cwd
; This just uses expand from vim.fn
(defn shortenFilename []
  (def output (core.expand "%:~:."))
  output)

; Get log file from buffer file name
(defn getLogFile []
  (def- fileName (shortenFilename))
  (def- regexObject :%w+$)
  ; sub the extension with the log file extension
  (def- output (: fileName :gsub (fileName:match regexObject) :log))
  output)
