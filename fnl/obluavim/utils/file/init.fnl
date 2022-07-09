(module obluavim.utils.file.init)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

;; Key -- a table of file management events
;; Structure: {file-name {:fs fs-event}}
(def id {})

; FN - Truncate the filename of the current file
; $output - returns truncated filename
(defn short-name [] (local output (core.expand "%:~:.")) output)

;; FN -- full path name
(defn name [] (core.expand "%:p"))

;; FN -- raw file extension
(defn extension [] (core.expand "%:e"))
