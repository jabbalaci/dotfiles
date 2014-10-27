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

;; show trailing whitespaces
;    (setq-default show-trailing-whitespace t)

;; dont wrap lines
    (setq-default truncate-lines t)

;; show function names
    (which-function-mode t)

;; launch the builtin REPL: M-x repl
(defun repl()
  (interactive) ; interactive call is permitted, see http://www.emacswiki.org/emacs/InteractiveFunction
   (ielm))

;; show tabs and trailing whitespaces only, http://redd.it/2keh6u
    (require 'whitespace)
    (setq whitespace-display-mappings
       ;; all numbers are Unicode codepoint in decimal. try (insert-char 182 ) to see it
      '(
        (space-mark 32 [183] [46]) ; 32 SPACE, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
        (newline-mark 10 [182 10]) ; 10 LINE FEED
        (tab-mark 9 [187 9] [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
        ))
    (setq whitespace-style '(face tabs trailing tab-mark))
    (set-face-attribute 'whitespace-tab nil
                        :background "#f0f0f0"
                        :foreground "#00a8a8"
                        :weight 'bold)
    (set-face-attribute 'whitespace-trailing nil
                        :background "#e4eeff"
                        :foreground "#183bc8"
                        :weight 'normal)
    (add-hook 'prog-mode-hook 'whitespace-mode)

(provide 'init-programming)
;;; init-programming.el ends here
