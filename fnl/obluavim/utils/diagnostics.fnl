(module obluavim.utils.diagnostics
  {autoload {buffers obluavim.utils.buffer
             files obluavim.utils.file
             s aniseed.string
             a aniseed.core
             }})

(def- diag vim.diagnostic)
(def- api vim.api)

; This handles the diagnostics-api functionality

; FN - get column numbers for potential match
; @lnum - the line number we got from the diagnostic table
; @message - the message from the diagnostic table
; $startCol - returns a start column for a match
; $endCol - returns an end column for a match
(defn matchDiagnostic [lnum message]
  (let [logFileName (files.getLogFile)
        logFileContents (s.split (a.slurp logFileName true) "\n")
        messagePattern "%[%w%] Line %d+ (.+)"
        linePattern "%[%w%] Line (%d+) .+"
        quotedPattern "['\"](%w+)['\"]"
        message message
        currentLine (api.nvim_buf_get_lines 0 lnum (+ lnum 1) false)]
    (var startCol -1)
    (var endCol -1)
    (var lastLine 0)
    (each [_ v (pairs logFileContents)]
      ; trim whitespace for easier parsing
      (var tempString (s.trim v))
      (set tempString (string.gsub tempString "\t" " "))

      ; only look for matches that match the line number
      (each [matched (: tempString :gmatch linePattern)]
        (when (= (tonumber matched) (+ lnum 1))
            ; look through the message pattern
            (each [messageMatched (: tempString :gmatch messagePattern)]
              ; for the quoted values
              (var foundMatch false)
              (when (= messageMatched message)
                (each [quoteMatched (: messageMatched :gmatch quotedPattern) :until (= foundMatch true)]
                  (if (not= lastLine matched)
                    (do ; set the columns
                      (set-forcibly! (startCol endCol) (string.find (. currentLine 1) quoteMatched))
                      (set foundMatch true)
                      ; if this is nil (ie the log isn't updated), just reset this
                      (when (= startCol nil) (set startCol -1) (set endCol -1)))
                    (do (set foundMatch false)))))))))
    (values (- startCol 1) endCol)))

; FN - generate diagnostics table
(defn genDiagnostics []
  (let [logFileName (files.getLogFile)
        logFileContents (s.split (a.slurp logFileName false) "\n")
        matchPattern "%[(%w)%] Line (%d+) (.+)"
        severityType {:I diag.severity.INFO
                      :W diag.severity.WARN
                      :E diag.severity.ERROR}
        groups {1 :severity
                2 :lnum
                3 :message}]

    ; create namespace
    (local ns (vim.api.nvim_create_namespace :namespace_name))

    ; parse through the log
    (var key 1)
    (var diagOutput {})
    (each [_ v (pairs logFileContents)]
      ; trim out both sides
      (var tempString (s.trim v))
      ; trim out tabs
      (set tempString (string.gsub tempString "\t" " "))
      ; if empty it means end of line, don't add an empty line
      (when (or (= tempString "") (= tempString nil)) (lua :break))

      ; parse log and apply it to a diagnostic table
      (tset diagOutput key (diag.match tempString matchPattern groups severityType))
      (tset diagOutput key :source "Construction Set ScriptSync")

      ; parse if there's a quote to highlight
      (local (startCol endCol) (matchDiagnostic (. (. diagOutput key) :lnum)
                                                (. (. diagOutput key) :message)))
      (when (>= startCol 0)
        (tset (. diagOutput key) :col startCol)
        (tset (. diagOutput key) :end_col endCol))

      (set key (+ key 1)))
    (diag.set ns 0 diagOutput {})))

