;;; conf/general.el -*- lexical-binding: t; -*-


(global-set-key (kbd "C-x k") 'kill-current-buffer) ;; skip verification

;; (after! smart-tab (global-smart-tab-mode t))

(setq
 browse-url-generic-program "brave"
 browse-url-browser-function #'browse-url-generi
 x-pointer-shape x-pointer-top-left-arrow)
(set-mouse-color "grey")

;; treemacs

;; (use-package! treemacs-projectile
;;   :config (setq treemacs-icons-dired-mode t
;;                 treemacs-project-map t
;;                 treemacs-git-mode t
;;                 treemacs-filewatch-mode t
;;                 google-this-mode t)
;;  )
(setq
 confirm-kill-emacs nil
 google-this-mode t
 )
;; (global-set-key (kbd "C-c t") 'treemacs-projectile)
;; (global-set-key (kbd "C-c T") 'treemacs) ;; toggle
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
;; (use-package! pdf-tools :defer t)
;; (use-package! org-pdftools)

;; or
(use-package! all-the-icons)
(use-package! adoc-mode
  :ensure t)
;; evil search
;; (global-set-key (kbd "C-c /") 'evil-search-yank-word)
;;
;; window related
;; (use-package! zoom :config (setq zoom-mode t))
;; (use-package! golden-ratio :config (setq golden-ratio-mode 1 golden-ratio-auto-scale t))
;; add to ~/.doom.d/config.el
;; (use-package! golden-ratio
;;   :after-call pre-command-hook
;;   :config
;;   (golden-ratio-mode +1)
;;   ;; Using this hook for resizing windows is less precise than
;;   ;; `doom-switch-window-hook'.
;;   (remove-hook 'window-configuration-change-hook #'golden-ratio)
;;   (add-hook 'doom-switch-window-hook #'golden-ratio))
(use-package! all-the-icons)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;
