; =====
; utf-8
; =====

;; utf-8 everywhere
    (prefer-coding-system 'utf-8)
    (set-default-coding-systems 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-language-environment 'utf-8)
    (set-selection-coding-system 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (setq locale-coding-system 'utf-8)

;; enable accents
    (require 'iso-transl)


(provide 'init-i18n)
;;; init-i18n.el ends here
