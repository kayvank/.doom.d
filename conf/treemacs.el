;;; conf/treemacs.el -*- lexical-binding: t; -*-

(use-package! treemacs
  :config
  (setq
   treemacs-follow-mode t
   treemacs-tag-follow-delay 2
   doom-themes-treemacs-theme "all-the-icons")

  )
(use-package! treemacs-all-the-icons
  :after treemacs)
