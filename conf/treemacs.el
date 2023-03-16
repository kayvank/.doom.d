;;; conf/treemacs.el -*- lexical-binding: t; -*-


(use-package! treemacs-magit)
;; (use-package! treemacs-icons-dired )
(use-package! treemacs
  :config
  (treemacs-load-theme "all-the-icons")
  (treemacs-load-all-the-icons-with-workaround-font t)
  (use-package! treemacs-all-the-icons
    :config
    (treemacs-load-theme "all-the-icons"))
  (use-package! treemacs-projectile
    :config
    (treemacs-load-theme "all-the-icons")
  )
  (setq
   treemacs-project-map t
   treemacs-git-mode t
   treemacs-filewatch-mode t
   google-this-mode t)
  )
(setq doom-themes-treemacs-theme "doom-colors")
