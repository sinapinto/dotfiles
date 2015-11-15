;; evil config

(require-package 'evil)
(evil-mode 1)

(define-key evil-normal-state-map "H" 'evil-first-non-blank)
(define-key evil-normal-state-map "L" 'evil-last-non-blank)
(define-key evil-normal-state-map (kbd "TAB") 'evil-jump-item)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd "C-p") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd ")") 'evil-window-bottom)
(define-key evil-normal-state-map (kbd "(") 'evil-window-top)

;;; esc quits
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

(require-package 'evil-commentary)
(evil-commentary-mode)

(require-package 'evil-surround)
(global-evil-surround-mode 1)

(provide 'init-evil)
