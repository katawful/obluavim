(module obluavim.utils.file)

; this file contains file management utilities

; rename APIs
(def- core vim.fn)
(def- api vim.api)

; Get the current name of buffer
(defn getBufferName []
  (let [bufName (api.nvim_buf_get_name 0)]
    bufName))

; Truncate full file path to just filename
(defn shortenFilename []
  (let [fileName (getBufferName)
        fileNameRegex :%w+%.%w+$]
    (def output (fileName:match fileNameRegex))
    output))

; Get log file from buffer file name
(defn getLogFile []
  (def- fileName (shortenFilename))
  (def- regexObject :%w+$)
  (def- output (: fileName :gsub (fileName:match regexObject) :log))
  output)
