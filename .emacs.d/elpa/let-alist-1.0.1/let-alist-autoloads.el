;;; let-alist-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (let-alist) "let-alist" "let-alist.el" (21652 1214
;;;;;;  266631 19000))
;;; Generated autoloads from let-alist.el

(autoload 'let-alist "let-alist" "\
Let-bind dotted symbols to their cdrs in ALIST and execute BODY.
Dotted symbol is any symbol starting with a `.'.  Only those present
in BODY are let-bound and this search is done at compile time.

For instance, the following code

  (let-alist alist
    (if (and .title .body)
        .body
      .site))

expands to

  (let ((.title (cdr (assq 'title alist)))
        (.body (cdr (assq 'body alist)))
        (.site (cdr (assq 'site alist))))
    (if (and .title .body)
        .body
      .site))

\(fn ALIST &rest BODY)" nil t)

(put 'let-alist 'lisp-indent-function '1)

;;;***

;;;### (autoloads nil nil ("let-alist-pkg.el") (21652 1214 332490
;;;;;;  664000))

;;;***

(provide 'let-alist-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; let-alist-autoloads.el ends here
