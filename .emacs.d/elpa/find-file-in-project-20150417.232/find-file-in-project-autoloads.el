;;; find-file-in-project-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (find-file-in-project ffip-current-full-filename-match-pattern-p)
;;;;;;  "find-file-in-project" "find-file-in-project.el" (21810 10559
;;;;;;  215567 398000))
;;; Generated autoloads from find-file-in-project.el

(autoload 'ffip-current-full-filename-match-pattern-p "find-file-in-project" "\
Is current full file name (including directory) match the REGEX?

\(fn REGEX)" nil nil)

(autoload 'find-file-in-project "find-file-in-project" "\
Prompt with a completing list of all files in the project to find one.

The project's scope is defined as the first directory containing
an `.emacs-project' file.  You can override this by locally
setting the variable `ffip-project-root'.

\(fn)" t nil)

(defalias 'ffip 'find-file-in-project)

(put 'ffip-patterns 'safe-local-variable 'listp)

(put 'ffip-project-file 'safe-local-variable 'stringp)

(put 'ffip-project-root 'safe-local-variable 'stringp)

(put 'ffip-limit 'safe-local-variable 'integerp)

;;;***

;;;### (autoloads nil nil ("find-file-in-project-pkg.el") (21810
;;;;;;  10559 284153 233000))

;;;***

(provide 'find-file-in-project-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; find-file-in-project-autoloads.el ends here
