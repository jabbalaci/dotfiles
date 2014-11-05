; =====================
; colors / color themes
; =====================

;; highlight the current line
    (global-hl-line-mode 1)

;; makes normal color theme work on terminal
;; if it looks ugly, add this line to your .bashrc:
;; export TERM="xterm-256color"
    (color-theme-approximate-on)

;; change cursor color depending on mode
    ;(setq evil-emacs-state-cursor '("red" box))
    ;(setq evil-normal-state-cursor '("green" box))
    ;(setq evil-visual-state-cursor '("orange" box))
    ;(setq evil-insert-state-cursor '("blue" bar))
    ;(setq evil-replace-state-cursor '("red" box))
    ;(setq evil-operator-state-cursor '("red" hollow))

;; color themes
;; reddit discussion: http://redd.it/2l4rbn
;; There are 3 ways to load them. One of them should work :)
;; 1)
;;    (require 'afternoon-theme)
;; 2)
;;    (load-theme 'molokai t)
;;    (require 'molokai-theme)
;; 3)
;;    (require 'moe-theme)
;;    (moe-dark)

    ; zenburn
    ;(require 'color-theme-zenburn)
    ;(color-theme-zenburn)
    ; monokai
    ;(require 'color-theme-monokai)
    ;(color-theme-monokai)
    ; solarized
    ;(require 'color-theme-solarized)
    ;(color-theme-solarized-dark)
    ;(color-theme-solarized-light)
    ;(require 'color-theme-wombat)
    ;(color-theme-wombat)
    ;(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-ample")
    ;(require 'ample-theme)
    ;(ample-theme)
    ;(require 'ample-light-theme)
    ;(ample-light-theme)
    ; badwolf
    ;(add-to-list 'custom-theme-load-path "~/.emacs.d/elpa/color-theme-badwolf")
    ;(load-theme 'badwolf t)

;; background colour
    ;(set-background-color "gray")


(provide 'init-colors)
;;; init-colors.el ends here
