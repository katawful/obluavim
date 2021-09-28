(module obluavim.utils.map
        {require-macros [obluavim.utils.macros]})

; This contains the functions related to default mappings

; Rename some stuff
(def- core vim.fn)

; This function creates a remappable function for default mappings
; NOTE: i took this idea from vimtex
(defn createMap [mode lhs rhs ...]
  (let [mode (tostring mode)
        lhs  (tostring lhs)
        rhs  (tostring rhs)]
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
