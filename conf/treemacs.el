;;; conf/treemacs.el -*- lexical-binding: t; -*-

(use-package! treemacs-projectile)
(use-package! treemacs-evil)
(use-package! treemacs
  :config
  (setq
   treemacs-follow-mode t
   treemacs-tag-follow-delay 2
   doom-themes-treemacs-theme "all-the-icons")
  :bind (
         ([f8] . treemacs-add-and-display-current-project-exclusively)
         ("S-<f8>" . treemacs)
         ("C-c t" . treemacs)
         )
  )
(use-package! treemacs-all-the-icons
  :after treemacs)
