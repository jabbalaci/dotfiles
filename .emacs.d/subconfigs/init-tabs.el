; ==========
; using tabs
; ==========

;; http://stackoverflow.com/questions/3811126/do-you-use-emacs-tabbar
    (require 'tabbar)
    (tabbar-mode t) ; turn on the tabbar

;; http://zhangda.wordpress.com/2012/09/21/tabbar-mode-rocks-with-customization/
    (setq tabbar-background-color "#666666") ;; the color of the tabbar background
    (custom-set-faces
     '(tabbar-default ((t (:inherit variable-pitch :background "#bfbfbf" :foreground "black"))))
     '(tabbar-button ((t (:inherit tabbar-default :foreground "dark red"))))
     '(tabbar-button-highlight ((t (:inherit tabbar-default))))
     '(tabbar-highlight ((t (:underline t))))
     '(tabbar-selected ((t (:inherit tabbar-default :background "#95CA59"))))
     '(tabbar-separator ((t (:inherit tabbar-default :background "black" :weight bold))))
     '(tabbar-unselected ((t (:inherit tabbar-default)))))

;; define all tabs to be one of 3 possible groups: “Emacs Buffer”, “Dired”,
;; “User Buffer”.
    (defun tabbar-buffer-groups ()
      "Return the list of group names the current buffer belongs to.
    This function is a custom function for tabbar-mode's tabbar-buffer-groups.
    This function group all buffers into 3 groups:
    Those Dired, those user buffer, and those emacs buffer.
    Emacs buffer are those starting with “*”."
      (list
       (cond
        ((string-equal "*" (substring (buffer-name) 0 1))
         "Emacs Buffer"
         )
        ((eq major-mode 'dired-mode)
         "Dired"
         )
        (t
         "User Buffer"
         )
        )))
    (setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

;; switch tabs with Ctrl+PgUp and Ctrl+PgDn
    (global-set-key (kbd "C-<prior>") 'tabbar-backward) ; page up key
    (global-set-key (kbd "C-<next>") 'tabbar-forward) ; page down key


(provide 'init-tabs)
;;; init-tabs.el ends here
