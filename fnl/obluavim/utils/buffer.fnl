(module obluavim.utils.buffer
        {autoload {files obluavim.utils.file
                   maps obluavim.utils.map
                   a aniseed.core
                   s aniseed.string
                   }})

; this file contains buffer management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

(var logBuffer "")

; FN - modify the log contents of the log file we acquire
; @export - boolean that tells if we export extra values or not
; @widthHeight - string that tells if we export width or height
; $logFile - returns modified log contents
; $logWidth - returns max width of log
; $logHeight - returns total height of log
(defn modifyLogContents [export widthHeight]
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
      (when (= value "") (lua :break))
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
; $logBuffer - returns a buffer of the log file, modified
(defn createLogBuffer []
  (local logFileName (files.getLogFile))
  (local logFile (modifyLogContents false :nil))
  ; see if buffer already exists
  ; NOTE: this doesn't actually see if the *same* buffer exists
  (if (= (core.bufexists logFileName) 0)
    (do
      (set logBuffer (api.nvim_create_buf false true))
      (api.nvim_buf_set_option logBuffer :filetype :ob_log)
      (api.nvim_buf_set_name logBuffer logFileName)
      ; (api.nvim_buf_set_name logBuffer (files.shortenFilename))
      (print "buf id is: " logBuffer)
      (api.nvim_buf_set_lines logBuffer 0 -1 false logFile)

      logBuffer)
    ; TODO error message function instead of just this
    (do
      (api.nvim_err_writeln "no log file"))
    )
  )

; FN - Open a window of the log buffer
(defn openLogWindow []
  (local winOpts {:relative :cursor
                  :width (modifyLogContents true :width)
                  :height (modifyLogContents true :height)
                  :row 1
                  :col 1
                  :style :minimal
                  :border :shadow
                  })
  (local localBuffer (createLogBuffer))
  (local localWindow (api.nvim_open_win localBuffer true winOpts))

  ; create maps for the log window, mostly just closes them all
  (local chars {1 :a 2 :b 3 :c 4 :d 5 :e 6 :f 7 :g 8 :i 9 :n 10 :o 11 :p
                12 :r 13 :s 14 :t 15 :u 16 :v 17 :w 18 :x 19 :y 20 :z
                21 :m 22 :q
                })
  (each [_ v (ipairs chars)]
    (maps.createMapForce :n v "<cmd>:bwipeout!<CR>"))
  )
