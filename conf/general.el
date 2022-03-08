;;; conf/general.el -*- lexical-binding: t; -*-

(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
  )

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification
(global-set-key (kbd "C-x 4") 'split-3-windows-horizontally-evenly)
;; configure auto formatters
(setq +format-on-save-enabled-modes
      '(not haskell-mode))

(after! smart-tab
  (global-smart-tab-mode t))

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function #'browse-url-generic)

;; treemacs

(use-package! treemacs-projectile)
(use-package! treemacs-magit)
(use-package! treemacs-icons-dired )

(setq
 treemacs-icons-dired-mode t
 treemacs-project-map t
 treemacs-git-mode t
 treemacs-filewatch-mode t)
