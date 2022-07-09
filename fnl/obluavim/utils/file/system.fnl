(module obluavim.utils.file.system)


;;; Handles interfacing with libuv filesystem operations
;;; Not for direct manipulation

;; FN -- generate a new filesystem event
(defn new! [] (vim.loop.new_fs_event))

;; FN -- start a filesystem event
(defn start! [fs path flags callback] (vim.loop.fs_event_start fs path flags callback))

;; FN -- stop a filesystem event
(defn stop! [fs] (vim.loop.fs_event_stop fs))

;; FN -- use a standardized path for anything
(defn path! [path] (vim.loop.fs_realpath path nil))
