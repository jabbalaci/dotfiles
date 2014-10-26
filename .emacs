; ====
; main
' ====

(setq user-full-name "Laszlo Szathmary")
(setq user-mail-address "jabba.laci@gmail.com")

; last update: 2014.10.26. (yyyy.mm.dd.)

(require 'package)
(package-initialize)

; "~/.emacs.d/elpa/" is visible by default and traversed recursively
(add-to-list 'load-path "~/.emacs.d/packages/")
(add-to-list 'load-path "~/.emacs.d/subconfigs/")

; Sometimes "emacs --debug-init" complains that it cannot load some
; packages, that's why they are added here.
; However, as I noticed, if you open a file with emacs (i.e. you don't
; launch it in debug mode), the error is gone :)
; Another thing to try: restart emacs. Often it doesn't complain
; after a restart :)
    ;(add-to-list 'load-path "~/.emacs.d/elpa/color-theme-6.6.1")
    ;(add-to-list 'load-path "~/.emacs.d/elpa/evil-1.0.9")
    ;(add-to-list 'load-path "~/.emacs.d/elpa/undo-tree-0.6.5")
    ;(add-to-list 'load-path "~/.emacs.d/elpa/helm-20141016.221")

; automatically byte compile everything that needs byte compiling each time I start emacs
; http://stackoverflow.com/questions/1217180
(setq max-lisp-eval-depth 1000) ; if you get "nesting exceeds max-lisp-eval-depth" error
(byte-recompile-directory (expand-file-name "~/.emacs.d/elpa/") 0)
(byte-recompile-directory (expand-file-name "~/.emacs.d/packages/") 0)
(byte-recompile-directory (expand-file-name "~/.emacs.d/subconfigs/") 0)

;; to avoid "Emacs pinky" under Ubuntu, do this:
;; https://askubuntu.com/questions/412576
;; in short: install gnome-tweak-tool, start it, choose the "Typing" tab
;; on the left. Then, from the dropdown next to "Ctrl key position" on
;; the right, choose "Caps Lock as Ctrl"
;; (or in newer versions: "Make Caps Lock an additional Ctrl").


(load "~/.emacs.d/init")
;;; .emacs ends here
