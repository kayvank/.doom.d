;;; conf/general.el -*- lexical-binding: t; -*-

(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
  )

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification
(global-set-key (kbd "C-x 4") 'split-3-windows-horizontally-evenly)

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function #'browse-url-generic
 x-pointer-shape x-pointer-top-left-arrow)
(set-mouse-color "grey")

;; treemacs

(setq confirm-kill-emacs nil)

(global-set-key (kbd "C-c t") 'treemacs-add-and-display-current-project-exclusively)
(global-set-key (kbd "C-c T") 'treemacs) ;; toggle
(global-set-key (kbd "C-c C-g w") 'google-this-word)
(global-set-key (kbd "C-c C-g l") 'google-this-line)
(global-set-key (kbd "C-c C-g r") 'google-this-region)

;; Swap line numbers using C-<f5>, you can change this of course
(autoload 'linum-mode "linum" "toggle line numbers on/off" t)
(global-set-key (kbd "C-<f5>") 'linum-mode)
(global-set-key (kbd "<f5>") 'revert-buffer-no-confirm)

  (defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (revert-buffer t t))
