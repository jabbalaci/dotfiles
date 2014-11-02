; ===============
; misc. utilities
; ===============

;; "after" macro
;; see https://github.com/bling/dotemacs/issues/9
    (if (fboundp 'with-eval-after-load)
        (defmacro after (feature &rest body)
          "After FEATURE is loaded, evaluate BODY."
          (declare (indent defun))
          `(with-eval-after-load ,feature ,@body))
      (defmacro after (feature &rest body)
        "After FEATURE is loaded, evaluate BODY."
        (declare (indent defun))
        `(eval-after-load ,feature
           '(progn ,@body))))

;; high-level file/dir manipulation
;; https://github.com/rejeep/f.el
    (require 'f)

;; experiments, how to execute an external command on a selection
;; http://ergoemacs.org/emacs/elisp_perl_wrapper.html
    (defun do-something-region (startPos endPos)
      "Do some text processing on region.
    This command calls the external script “wc”."
    (interactive "r")
      (let (scriptName)
        (setq scriptName "/usr/bin/wc -w") ; full path to your script
        (shell-command-on-region startPos endPos scriptName nil t nil t)
        ))


(provide 'init-utils)
;;; init-utils.el ends here
