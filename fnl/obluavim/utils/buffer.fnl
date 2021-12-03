(module obluavim.utils.buffer
        {autoload {files obluavim.utils.file
                   a aniseed.core
                   s aniseed.string
                   }})

; this file contains buffer management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; FN - modify the log contents of the log file we acquire
; @export - do we export any extra values
; @widthHeight - export width or height
(fn modifyLogContents [export widthHeight]
  (let [logFileName (files.getLogFile)
        ; slurp it up into a table
        logFileContents (s.split (a.slurp logFileName true) "\n")
        logFile {}]
    ; set height and width for export
    (var logHeight "")
    (var logWidth 0)

    ; parse through each line to modify it
    (each [key value (pairs logFileContents)]
      ; if empty it means end of line, don't add an empty line
      (when (= value "")
        (lua :break))
      ; trim out both sides
      (var tempString (s.trim value))
      ; trim out tabs
      (set tempString (string.gsub tempString "\t" " "))
      ; set height to key, will return the last automatically
      (set logHeight key)
      ; if logWidth is smaller then set it to the temp value
      (local tempWidth (length value))
      (if (> tempWidth logWidth)
        (set logWidth tempWidth))
      (tset logFile key tempString))

    ; values to export
    (match export
      false (do logFile)
      true (do (match widthHeight
               :width (do logWidth)
               :height (do logHeight))))))

; FN - Create a buffer of the log file while seeing if it exists
(defn createLogBuffer []
  (local logFileName (files.getLogFile))
  (local logName (modifyLogContents false :nil))
  ;see if buffer already exists
  ; NOTE: this doesn't actually see if the *same* buffer exists
  (if (= (core.bufexists logFileName) 0)
    (do
      (def logBuffer (api.nvim_create_buf false true))
      ; (api.nvim_buf_set_name logBuffer (files.shortenFilename))
      (print "buf id is: " logBuffer)
      (api.nvim_buf_set_lines logBuffer 0 -1 false logFileContents)
      logBuffer)
    ; TODO error message function instead of just this
    (do
      (api.nvim_err_writeln "no log file"))
    )
  )

; FN - Open a window of the log buffer
(defn openLogWindow []
  (def- winOpts {:relative :cursor
                 :width (modifyLogContents true :width)
                 :height (modifyLogContents true :height)
                 :row 1
                 :col 1
                 :style :minimal
                 :border :shadow
                 })
  (def- localBuffer (createLogBuffer))
  (def localWindow (api.nvim_open_win localBuffer true winOpts))
  )
