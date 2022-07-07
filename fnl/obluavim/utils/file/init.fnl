(module obluavim.utils.file.init)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)
(def- sys-loop vim.loop)

; store a filesystem event for the file that calls this
(def fs (vim.loop.new_fs_event))

; FN - Truncate the filename of the current file
; $output - returns truncated filename
(defn short-name []
  (local output (core.expand "%:~:."))
  output)

(defn extension []
  (core.expand "%:e"))
