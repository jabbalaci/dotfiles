; ===========
; programming
; ===========

;; show the matching parenthesis, brace or bracket automatically
    (show-paren-mode t)

;; insert parentheses, braces, quotes and the like in matching pairs
    (require 'autopair)
    (autopair-global-mode)

;; surrounding, https://github.com/timcharper/evil-surround
    (require 'evil-surround)
    (global-evil-surround-mode 1)

;; replace TAB with 4 spaces
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 4)
    (setq indent-line-function 'insert-tab)

;; guess indentation settings from buffers
    (require 'dtrt-indent)
    (dtrt-indent-mode 1)

;; auto-indent with the return key
    (define-key global-map (kbd "RET") 'newline-and-indent)

;; remove whitespace before saving
    (add-hook 'before-save-hook 'delete-trailing-whitespace)

;; dont wrap lines
    (setq-default truncate-lines t)

;; show function names
    (which-function-mode t)

;; launch the builtin REPL: M-x repl
(defun repl()
  (interactive) ; interactive call is permitted, see http://www.emacswiki.org/emacs/InteractiveFunction
   (ielm))


(provide 'init-programming)
;;; init-programming.el ends here
