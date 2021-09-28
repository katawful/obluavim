(module obluavim.utils.file)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; Get the current name of buffer
(defn getBufferName []
  (let [bufName (api.nvim_buf_get_name 0)]
    bufName))
