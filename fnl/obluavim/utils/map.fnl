(module obluavim.utils.map
        {require-macros [obluavim.utils.macros]})

; This contains the functions related to default mappings

; Rename some stuff
(def- core vim.fn)

; FN - Create maps within functions
; @mode - a character that defines what mode to use, n, i, v
; @lhs - the left hand side of a keymap
; @rhs - the right hand side of a keymap
; @... - for map options
(defn createMap [mode lhs rhs ...]
  (let [mode (tostring mode)
        lhs  lhs
        rhs  rhs]
    (if 
      ; if we don't already have a map to right hand
      (and (= (core.hasmapto rhs mode) 0)
          ; and if lhs isn't mapped already
          (> (core.empty (core.maparg lhs mode)) 0))
      (do
        (match mode
          :n (do
               (nm- lhs rhs :silent :buffer :nowait))
          :v (do
               (vm- lhs rhs :silent :buffer :nowait))
          :i (do
               (im- lhs rhs :silent :buffer :nowait))
          )))))

; FN - Force create maps within functions
; @mode - a character that defines what mode to use, n, i, v
; @lhs - the left hand side of a keymap
; @rhs - the right hand side of a keymap
; @... - for map options
(defn createMapForce [mode lhs rhs ...]
  (let [mode (tostring mode)
        lhs  lhs
        rhs  rhs]
    (match mode
      :n (do
           (nm- lhs rhs :silent :buffer :nowait))
      :v (do
           (vm- lhs rhs :silent :buffer :nowait))
      :i (do
           (im- lhs rhs :silent :buffer :nowait))
      )))
