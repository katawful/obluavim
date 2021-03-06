(module obluavim.utils.map
        {require-macros [katcros-fnl.macros.nvim.api.maps.macros]})

; This contains the functions related to default mappings

; Rename some stuff
(def- core vim.fn)

; FN - Create maps within functions
; @mode - a character that defines what mode to use, n, i, v
; @lhs - the left hand side of a keymap
; @rhs - the right hand side of a keymap
; @... - for map options
(defn create [mode lhs rhs ...]
      "create a map for this plugin, not overwriting if possible"
      (let [mode (tostring mode)
            lhs lhs
            rhs rhs]
        (if ; if we don't already have a map to right hand
            (and (= (core.hasmapto rhs mode) 0)
                 ; and if lhs isn't mapped already
                 (> (core.empty (core.maparg lhs mode)) 0))
            (do
              (match mode
                :n (do
                     (nm- lhs rhs {:silent true :buffer true :nowait true}))
                :v (do
                     (vm- lhs rhs {:silent true :buffer true :nowait true}))
                :i (do
                     (im- lhs rhs {:silent true :buffer true :nowait true})))))))

; FN - Force create maps within functions
; @mode - a character that defines what mode to use, n, i, v
; @lhs - the left hand side of a keymap
; @rhs - the right hand side of a keymap
; @... - for map options
(defn create-force [mode lhs rhs ...]
      "force create a map for this plugin, overwrite with noremap"
      (let [mode (tostring mode)
            lhs lhs
            rhs rhs]
        (match mode
          :n (do
               (nm- lhs rhs {:silent true :buffer true :nowait true}))
          :v (do
               (vm- lhs rhs {:silent true :buffer true :nowait true}))
          :i (do
               (im- lhs rhs {:silent true :buffer true :nowait true})))))
