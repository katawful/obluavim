(module obluavim.utils.map-test
        {autoload {map obluavim.utils.map}})

; this module tests obluavim.utils.map file

(deftest create
  (t.pr= (vim.api.nvim_buf_set_keymap 0 :n :a :b {:noremap false :nowait true :silent true}) 
         (map.create :n :a :b)) 
  "creates remappable map in mode 'l' of lhs 'a' and rhs 'b'")

(deftest create
  (t.pr= (vim.api.nvim_buf_set_keymap 0 :n :a :b {:noremap false :nowait true :silent true}) 
         (map.create-force :n :a :b)) 
  "creates remappable map in mode 'l' of lhs 'a' and rhs 'b'")
