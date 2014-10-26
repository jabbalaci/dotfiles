; ===============================================
; Evil -- turning emacs into a usable text editor
; ===============================================

;; Evil -- an extensible vi layer for Emacs
    (require 'evil)
    (evil-mode 1)
    (setq evil-default-cursor t) ; otherwise the cursor is always black

;; vim-like undo
    (require 'undo-tree)
    (global-undo-tree-mode)
    (global-set-key (kbd "\C-r") 'undo-tree-redo)

;; Use fine grain undo. But remember, we shouldn't stay long in insert mode.
    (setq evil-want-fine-undo t)

;; This way Y is more logical. Yank until the end of line.
    (define-key evil-normal-state-map (kbd "Y") "y$")

;; C-a is: go to the beginning of the line
;; let C-e be what it was in Emacs: go to the end of the line
;; TODO: make it work in insert and replace modes too
    (define-key evil-normal-state-map (kbd "C-e") "$")

;; define the leader character
    (setq evil-leader/in-all-states 1)
    (global-evil-leader-mode)
    (evil-leader/set-leader ",")

; https://github.com/juanjux/evil-search-highlight-persist
; (require 'evil-search-highlight-persist)
; (global-evil-search-highlight-persist t)
; (evil-leader/set-key "SPC" 'evil-search-highlight-persist-remove-all)

;; powerline, https://github.com/Dewdrops/powerline
    (require 'powerline)
    ;(powerline-default-theme)
    (powerline-evil-theme)

;; https://github.com/cofi/evil-numbers
    (require 'evil-numbers)
    (define-key evil-normal-state-map (kbd "C-<kp-add>") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C-<kp-subtract>") 'evil-numbers/dec-at-pt)

; j/k for browsing wrapped lines
    (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "<down>") 'evil-next-visual-line)
    (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
    (define-key evil-normal-state-map (kbd "<up>") 'evil-previous-visual-line)

;; esc quits
    (defun minibuffer-keyboard-quit ()
      "Abort recursive edit.
    In Delete Selection mode, if the mark is active, just deactivate it;
    then it takes a second \\[keyboard-quit] to abort the minibuffer."
      (interactive)
      (if (and delete-selection-mode transient-mark-mode mark-active)
          (setq deactivate-mark  t)
        (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
        (abort-recursive-edit)))
    (define-key evil-normal-state-map [escape] 'keyboard-quit)
    (define-key evil-visual-state-map [escape] 'keyboard-quit)
    (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
    (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
    (global-set-key [escape] 'evil-exit-emacs-state)

;; show the full path of the current file being edited
    (defun show-file-path ()
      "Show the full path file name in the minibuffer."
      (interactive)
      (message (buffer-file-name))    ; show it
      (kill-new (buffer-file-name))   ; and save it to the clipboard
      )
;    (global-set-key [C-f1] 'show-file-name)
    (evil-leader/set-key "fp" 'show-file-path) ; file path

;; show just the name and extension of the current file being edited
    (defun show-file-name ()
      (interactive)
      (setq fname (f-filename (buffer-file-name)))
      (message fname)    ; show it
      (kill-new fname)   ; and save it to the clipboard
      )
    (evil-leader/set-key "fn" 'show-file-name) ; file name

;; window move
    (define-key evil-normal-state-map (kbd "C-w <up>") 'windmove-up)
    (define-key evil-normal-state-map (kbd "C-w <down>") 'windmove-down)
    (define-key evil-normal-state-map (kbd "C-w <right>") 'windmove-right)
    (define-key evil-normal-state-map (kbd "C-w <left>") 'windmove-left)

;; ex-mode commands
;; Normal map
;; TODO: I had problems with elscreen, it made my tabs (tabbar) look strange.
;;       So I want a solution without elscreen.
;;       Current problem: if a window is split and I use :q, it should
;;                        close just one window. Currently it closes all
;;                        buffers of this file.
    (defun vimlike-quit ()
      "Vimlike ':q' behavior: close current window if there are split windows;
        otherwise, close current tab (elscreen)."
      (interactive)
      (kill-this-buffer))

    (defun vimlike-write-quit ()
      "Vimlike ':wq' behavior: write then close..."
      (interactive)
      (save-buffer)
      (vimlike-quit))

    (evil-ex-define-cmd "q" 'vimlike-quit)
    (define-key evil-normal-state-map (kbd "C-k") 'vimlike-quit) ; kill
    (evil-ex-define-cmd "wq" 'vimlike-write-quit)
    (evil-ex-define-cmd "Q" 'save-buffers-kill-terminal) ; close emacs

;; :hsp calls :sp (means horizontal split). :hsp is more logical for me
    (evil-ex-define-cmd "hsp" 'split-window-vertically) ; horizontal split (called vertical in emacs...)

;; ,erc : edit resource file ~/.emacs
    (defun edit-rc-file ()
      "Edit the ~/.emacs file."
      (interactive)
      (find-file "~/.emacs")
      )
    (evil-leader/set-key "erc" 'edit-rc-file)

;; ,src : source (reload) resource file ~/.emacs
    (defun source-rc-file ()
      "Source the ~/.emacs file."
      (interactive)
      (load-file "~/.emacs")
      )
    (evil-leader/set-key "src" 'source-rc-file)


(provide 'init-evil)
;;; init-evil.el ends here
