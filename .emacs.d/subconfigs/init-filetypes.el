; =========
; filetypes
; =========


; Markdown
; --------
;; http://jblevins.org/projects/markdown-mode/
    (autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
    (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

; JSON
; ----
;; function to reformat json (python required)
    (defun json-format ()
      (interactive)
      (save-excursion
        (shell-command-on-region
         (mark) (point) "python -m json.tool" (buffer-name) t)))

; XML
; ---
;; function to reformat XML (xmllint required)
;; Usage: select the area to format, then call the function.
    (defun xml-format ()
      (interactive)
      (save-excursion
        (shell-command-on-region
         (mark) (point) "xmllint --format -" (buffer-name) t)))


(provide 'init-filetypes)
;;; init-filetypes.el ends here
