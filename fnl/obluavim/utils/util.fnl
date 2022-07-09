(module obluavim.utils.util)

; This handles random utility needs

(def- core vim.fn)
(def- api vim.api)

; FN - caps floating window width
; @inputWidth - a number for the input width
; $outputWidth - the capped width
(defn capFloatWidth [inputWidth]
      (let [winWidth (api.nvim_win_get_width 0)]
        (var outputWidth inputWidth)
        (when (>= inputWidth winWidth)
          (set outputWidth (- winWidth 2)))
        outputWidth))

; FN - caps floating window height
; @inputHeight - a number for the input height
; $outputHeight - the capped height
(defn capFloatHeight [inputHeight]
      (let [winHeight (api.nvim_win_get_height 0)]
        (var outputHeight inputHeight)
        (when (>= inputHeight winHeight)
          (set outputHeight (- winHeight 2)))
        outputHeight))
