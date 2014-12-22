; ==========================
; interface-related settings
; ==========================

;; Larger font. The value is in 1/10pt, so 100 will give you 10pt, etc.
    (set-face-attribute 'default nil :height 160)

;; change the color of selection to make it more visible
    ;(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")
    ;(set-face-attribute 'region nil :background "#5454ff" :foreground "#000000")
    ;(set-face-attribute 'region nil :background "#a7a7f6" :foreground "#000000")
    ;(set-face-attribute 'region nil :background "#c4c4f3" :foreground "#000000")
    (set-face-attribute 'region nil :background "#d9d9f8" :foreground "#000000")

;; show tildes (~) for blank lines after the last line
;; normal way: emacs uses a different symbol but it's very similar
    (setq-default indicate-empty-lines t)
;; extra: replace with tildes (~)
;; http://redd.it/2kdztw
;    (progn
    (define-fringe-bitmap 'tilde [0 0 0 113 219 142 0 0] nil nil 'center)
    (setcdr (assq 'empty-line fringe-indicator-alist) 'tilde) ;)
    (set-fringe-bitmap-face 'tilde 'font-lock-function-name-face)

;; start maximized
    (custom-set-variables
     '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; start scratch in text mode (usefull to get a faster Emacs load time
;; because it avoids autoloads of elisp modes)
    (setq initial-major-mode 'text-mode)

;; scratch buffer empty
    (setq initial-scratch-message nil)

;; hide welcome screen
    (setq inhibit-splash-screen t)
    (setq inhibit-startup-message t)

;; how to stop “*Buffer List*” from showing when opening 3+ files
    (setq inhibit-startup-buffer-menu t)

;; force Emacs to only have one window visible upon startup
    (add-hook 'after-init-hook 'delayed-delete-other-windows)
    (defun delayed-delete-other-windows ()
      "need the call to happen after startup runs, so wait for idle"
      (run-with-idle-timer 0 nil 'delete-other-windows))

;; refresh buffers automatically if they changed on disk
    (global-auto-revert-mode t)

;; follow the link and visit the real file
    (setq vc-follow-symlinks t)

;; Show line numbers. Manually: M-x linum-mode
    (require 'linum)
    (global-linum-mode)

;; show column numbers
    (setq column-number-mode t)

;; line by line scrolling, https://github.com/aspiers/smooth-scrolling
; I had problems with this one below. Sometimes it jumped 2 lines.
;    (setq scroll-margin 2
;    scroll-conservatively 9999
;    scroll-step 1)

;; line by line scrolling, http://stackoverflow.com/questions/3631220
;; update: it also jumps 2 lines sometimes when moving up :(
    (setq redisplay-dont-pause t
      scroll-margin 2
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; save backup files (~) to a dedicated directory
    (setq make-backup-files t)
    (setq version-control t)
    (setq backup-directory-alist (quote ((".*" . "~/tmp/emacs/"))))
    (setq delete-old-versions t)

;; store autosave files (#) to a dedicated directory
    (setq auto-save-file-name-transforms `((".*", "~/tmp/emacs/" t)))

;; indicate the location of the fill column, http://www.emacswiki.org/emacs-en/FillColumnIndicator
    (setq-default fill-column 79)
    (require 'fill-column-indicator)
    (define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
    (global-fci-mode 1)

;; remember the cursor position of files when reopening them
    (require 'saveplace)
    (setq-default save-place t)
    (setq save-place-file "~/tmp/.emacs_saveplace")

;; relative line numbers
;    (add-hook 'prog-mode-hook 'relative-line-numbers-mode t)
;    (add-hook 'prog-mode-hook 'line-number-mode t)
;    (add-hook 'prog-mode-hook 'column-number-mode t)

;; y or n is enough
    (defalias 'yes-or-no-p 'y-or-n-p)

;; no blinking
    (blink-cursor-mode -1)

; ; dont clutter the modeline bar with minor modes indicators
;     (add-to-list 'load-path "~/.emacs.d/elpa/diminish-20091203.1012")
;     (require 'diminish)
;     (diminish 'visual-line-mode)
;     (after 'autopair (diminish 'autopair-mode))
;     (after 'undo-tree (diminish 'undo-tree-mode))
;     (after 'auto-complete (diminish 'auto-complete-mode))
;     (after 'projectile (diminish 'projectile-mode))
;     (after 'yasnippet (diminish 'yas-minor-mode))
;     (after 'guide-key (diminish 'guide-key-mode))
;     (after 'eldoc (diminish 'eldoc-mode))
;     (after 'smartparens (diminish 'smartparens-mode))
;     (after 'company (diminish 'company-mode))
;     (after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
;     (after 'git-gutter+ (diminish 'git-gutter+-mode))
;     (after 'magit (diminish 'magit-auto-revert-mode))
;     (after 'hs-minor-mode (diminish 'hs-minor-mode))

;; toggle fullscreen mode
    (defun toggle-frame-fullscreen ()
      "Toggle fullscreen mode of the selected frame.
    Enable fullscreen mode of the selected frame or disable if it is
    already fullscreen.  Ignore window manager screen decorations.
    When turning on fullscreen mode, remember the previous value of the
    maximization state in the temporary frame parameter `maximized'.
    Restore the maximization state when turning off fullscreen mode.
    See also `toggle-frame-maximized'."
      (interactive)
      (modify-frame-parameters
       nil
       `((maximized
          . ,(unless (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
           (frame-parameter nil 'fullscreen)))
         (fullscreen
          . ,(if (memq (frame-parameter nil 'fullscreen) '(fullscreen fullboth))
             (if (eq (frame-parameter nil 'maximized) 'maximized)
             'maximized)
           'fullscreen)))))
    (global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)


(provide 'init-interface)
;;; init-interface.el ends here
