; ==================
; python development
; ==================

; Elpy: http://elpy.readthedocs.org/en/latest/index.html
    (elpy-enable)

;; stop Yasnippet auto-indent, http://xahlee.blogspot.hu/2012/04/emacs-stop-yasnippet-auto-indent.html
;; you can also try 'fixed' instead of 'nil'
    (setq yas/indent-line nil)

; ;;flymake/flymake-cursor python pep008 check
;     (setq pycodechecker "~/.emacs.d/subconfigs/pyCheck.sh")
;     (when (load "flymake" t)
;       (defun dss/flymake-pycodecheck-init ()
;         (let* ((temp-file (flymake-init-create-temp-buffer-copy
;                            'flymake-create-temp-inplace))
;                (local-file (file-relative-name
;                             temp-file
;                             (file-name-directory buffer-file-name))))
;           (list pycodechecker (list local-file))))
;       (add-to-list 'flymake-allowed-file-name-masks
;                    '("\\.py\\'" dss/flymake-pycodecheck-init))
;       (load-library "flymake-cursor"))

(global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))
(add-hook 'python-mode-hook (lambda () (setq flycheck-checker 'python-pylint)))
;(add-hook 'after-init-hook #'global-flycheck-mode)

;; a "run script" for Python 2
    (defun run-python2-script ()
      (interactive)
      (shell-command (format "python2 %s" (buffer-name)) "*python-output*"))
    (global-set-key (kbd "C-<f2>") 'run-python2-script) ; run with Python 2

;; a "run script" for Python 3
    (defun run-python3-script ()
      (interactive)
      (shell-command (format "python3 %s" (buffer-name)) "*python-output*"))
    (global-set-key (kbd "C-<f3>") 'run-python3-script) ; run with Python 3

;; sort import lines
;; https://github.com/paetzke/py-isort.el/issues/7
    (require 'py-isort)
    (define-key evil-visual-state-map (kbd "C-i") 'py-isort-region) ; sort selected imports

(provide 'init-python)
;;; init-python.el ends here
