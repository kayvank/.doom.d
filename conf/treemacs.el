;;; conf/treemacs.el -*- lexical-binding: t; -*-

(use-package! treemacs
  :config
  (setq
   treemacs-follow-mode t
   treemacs-tag-follow-delay 2)
  :bind (
         ([f8] . treemacs-add-and-display-current-project-exclusively)
         ("S-<f8>" . treemacs)
         ("C-c t" . treemacs)
         )
  )
