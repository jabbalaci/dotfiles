; =============
; file explorer
; =============

;; file/dir explorer with dired
    (global-set-key (kbd "<f4>") 'dired)

;; file/dir explorer with dirtree
    (require 'dirtree)
    (autoload 'dirtree "dirtree" "Add directory to tree view" t)
    (global-set-key (kbd "C-<f4>") 'dirtree-show)


(provide 'init-explorer)
;;; init-explorer.el ends here
