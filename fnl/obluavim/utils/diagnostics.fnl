(module obluavim.utils.diagnostics
  {autoload {buffers obluavim.utils.buffer
             files obluavim.utils.file
             s aniseed.string
             a aniseed.core
             }})

(def- diag vim.diagnostic)
(def- api vim.api)

; This handles the diagnostics-api functionality

; FN - generate diagnostics table
(defn genDiagnostics []
  (let [logFileName (files.getLogFile)
        logFileContents (s.split (a.slurp logFileName true) "\n")
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
      (set key (+ key 1)))
    (diag.set ns 0 diagOutput {})))
