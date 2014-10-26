; ====
; Helm
; ====

; ;; activate helm mode
;     (require 'helm-config)
;     (helm-mode 1)
;
; ;; Helm's M-x mode
;     (global-set-key (kbd "M-x") 'helm-M-x)
;
; ; ;; helm settings (TAB in helm window for actions over selected items,
; ; ;; C-SPC to select items)
; (require 'helm-misc)
; ; ;(require 'helm-projectile)
; (require 'helm-locate)
; (setq helm-quick-update t
;       helm-bookmark-show-location t
;       helm-buffers-fuzzy-matching t)
;
; ; ;(after 'projectile
; ; ;  (require-package 'helm-projectile))
;
; ; (defun helm-my-buffers ()
; ;   (interactive)
; ;   (require 'helm-files)
; ;   (let ((helm-ff-transformer-show-only-basename nil))
; ;   (helm-other-buffer '(helm-c-source-buffers-list
; ;                        helm-c-source-elscreen
; ;                        helm-c-source-occur
; ;                        ;;                        helm-c-source-projectile-files-list
; ;                        helm-c-source-ctags
; ;                        helm-c-source-recentf
; ;                        helm-c-source-locate)
; ;                      "*helm-my-buffers*")))

(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

; (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
; (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
; (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

; (when (executable-find "curl")
;   (setq helm-google-suggest-use-curl-p t))
;
; (setq helm-quick-update                     t ; do not display invisible candidates
;       helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;       helm-buffers-fuzzy-matching           t ; fuzzy matching buffer names when non--nil
;       helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;       helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;       helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;       helm-ff-file-name-history-use-recentf t)

;; Helm's M-x mode
    (global-set-key (kbd "M-x") 'helm-M-x)

;; activate helm-mini
    (global-set-key (kbd "C-x h") 'helm-mini) ; h for helm

(helm-mode 1)


(provide 'init-helm)
;;; init-helm.el ends here
