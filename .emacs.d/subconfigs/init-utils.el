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


(provide 'init-utils)
;;; init-utils.el ends here
