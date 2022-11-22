;;; conf/general.el -*- lexical-binding: t; -*-

(defun split-3-windows-horizontally-evenly ()
  (interactive)
  (command-execute 'split-window-horizontally)
  (command-execute 'split-window-horizontally)
  (command-execute 'balance-windows)
  )

(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification
(global-set-key (kbd "C-x 4") 'split-3-windows-horizontally-evenly)

;; (after! smart-tab (global-smart-tab-mode t))

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function #'browse-url-generi
 x-pointer-shape x-pointer-top-left-arrow)
(set-mouse-color "grey")

;; treemacs

(use-package! treemacs-magit)
(use-package! treemacs-icons-dired )

(use-package! treemacs-projectile
  :config (setq treemacs-icons-dired-mode t
                treemacs-project-map t
                treemacs-git-mode t
                treemacs-filewatch-mode t
                google-this-mode t)
 )
(setq confirm-kill-emacs nil)
(global-set-key (kbd "C-c t") 'treemacs-projectile)
(global-set-key (kbd "C-c T") 'treemacs) ;; toggle
(global-set-key (kbd "C-c C-g w") 'google-this-word)
(global-set-key (kbd "C-c C-g l") 'google-this-line)
(global-set-key (kbd "C-c C-g r") 'google-this-region)

(global-unset-key (kbd "M-d"))
(global-set-key (kbd "M-d") 'evil-multiedit-match-and-next)
(global-unset-key (kbd "M-D"))
(global-set-key (kbd "M-D") 'evil-multiedit-match-and-prev)
(global-unset-key (kbd "M-a"))
(global-set-key (kbd "M-a") 'evil-multiedit-match-all)
(global-unset-key (kbd "M-A"))
(global-set-key (kbd "M-A") 'evil-multiedit-abort)
;; (global-whitespace-mode +1)
(setq browse-url-generic-program "brave"
     browse-url-browser-function 'browse-url-generic)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)

(use-package! org-contrib)
(use-package! pdf-tools
  :defer t
  :config
  (use-package! org-pdftools)
  )
