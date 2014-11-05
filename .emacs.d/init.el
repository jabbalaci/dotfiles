; ===============
; call subconfigs
; ===============

(require 'init-utils)

(require 'init-interface)
(require 'init-packages)
(require 'init-i18n)
(require 'init-server)
; helm stealed some key bindings, like "gf" that opens the file under the cursor,
; so I switched it off
;(require 'init-helm)
(require 'init-evil)
(require 'init-buffers)
(require 'init-programming)
(require 'init-python)
(require 'init-clojure)
(require 'init-colors)
(require 'init-filetypes)
(require 'init-autocomplete)
(require 'init-tabs)
(require 'init-explorer)
(require 'init-org)
(require 'init-twitter)


(provide 'init)
;;; init.el ends here
