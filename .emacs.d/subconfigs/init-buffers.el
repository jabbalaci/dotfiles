; ===================
; Buffers and windows
; ===================

;; show/change buffers
    (global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)

; navigate around the windows on the screen
    (global-set-key (kbd "C-x <up>") 'windmove-up)
    (global-set-key (kbd "C-x <down>") 'windmove-down)
    (global-set-key (kbd "C-x <right>") 'windmove-right)
    (global-set-key (kbd "C-x <left>") 'windmove-left)

;; better buffer names for duplicates
    (require 'uniquify)
    (setq uniquify-buffer-name-style 'forward
        uniquify-separator "/"
        uniquify-ignore-buffers-re "^\\*" ; leave special buffers alone
        uniquify-after-kill-buffer-p t)

;; activate ido
    (require 'ido)
    (ido-mode t)
    (setq ido-ignore-buffers '("^ " "*Completions*" "*Shell Command Output*"
                   "*Messages*" "Async Shell Command" "*scratch*"))
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (define-key evil-normal-state-map (kbd "C-b") 'ido-switch-buffer) ; custom binding
    (evil-leader/set-key "b" 'ido-switch-buffer) ; buffer switch with ido


(provide 'init-buffers)
;;; init-buffers.el ends here
