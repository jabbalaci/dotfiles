; ============
; emacs server
; ============

;; start emacs-server if not running
    (add-hook 'after-init-hook
        (lambda ()
          (require 'server)
          (unless (server-running-p)
            (server-start))))


(provide 'init-server)
;;; init-server.el ends here
