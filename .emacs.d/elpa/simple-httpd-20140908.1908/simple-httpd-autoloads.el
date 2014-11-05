;;; simple-httpd-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (httpd-serve-directory httpd-stop httpd-start)
;;;;;;  "simple-httpd" "../../../../../../../home/jabba/.emacs.d/elpa/simple-httpd-20140908.1908/simple-httpd.el"
;;;;;;  "552cabcea3ab7391d69c1f465100d860")
;;; Generated autoloads from ../../../../../../../home/jabba/.emacs.d/elpa/simple-httpd-20140908.1908/simple-httpd.el

(autoload 'httpd-start "simple-httpd" "\
Start the web server process. If the server is already
running, this will restart the server. There is only one server
instance per Emacs instance.

\(fn)" t nil)

(autoload 'httpd-stop "simple-httpd" "\
Stop the web server if it is currently running, otherwise do nothing.

\(fn)" t nil)

(autoload 'httpd-serve-directory "simple-httpd" "\
Start the web server with given `directory' as `httpd-root'.

\(fn DIRECTORY)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../../../home/jabba/.emacs.d/elpa/simple-httpd-20140908.1908/simple-httpd-pkg.el"
;;;;;;  "../../../../../../../home/jabba/.emacs.d/elpa/simple-httpd-20140908.1908/simple-httpd.el")
;;;;;;  (21590 45209 722306 840000))

;;;***

(provide 'simple-httpd-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; simple-httpd-autoloads.el ends here
