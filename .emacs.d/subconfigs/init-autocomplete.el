; ==============================
; autocomplete / code completion
; ==============================

;; yasnippet
;; should be loaded before auto complete so that they can work together
    (require 'yasnippet)
    (yas-global-mode 1)
;
; ;; auto complete mod
; ;; should be loaded after yasnippet so that they can work together
;     (require 'auto-complete-config)
;     (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
;     (ac-config-default)
;
; ;; set the trigger key so that it can work together with yasnippet on tab key,
; ;; if the word exists in yasnippet, pressing tab will cause yasnippet to
; ;; activate, otherwise, auto-complete will
;     (ac-set-trigger-key "TAB")
;     (ac-set-trigger-key "<tab>")


(provide 'init-autocomplete)
;;; init-autocomplete.el ends here
