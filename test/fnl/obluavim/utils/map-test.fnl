(module obluavim.utils.map-test
        {autoload {maps obluavim.utils.map}})

; this module tests obluavim.utils.map file

(deftest createMap
  (t.pr= (vim.api.nvim_buf_set_keymap 0 :n :a :b {:noremap false :nowait true :silent true}) 
         (maps.createMap :n :a :b)) 
  "creates remappable map in mode 'l' of lhs 'a' and rhs 'b'")

(deftest createMapForce
  (t.pr= (vim.api.nvim_buf_set_keymap 0 :n :a :b {:noremap false :nowait true :silent true}) 
         (maps.createMap :n :a :b)) 
  "creates remappable map in mode 'l' of lhs 'a' and rhs 'b'")
