;;; ../dev/workspaces/workspace-emacs/kayvan/doom.d/elfeed.el -*- lexical-binding: t; -*-
(use-package! elfeed)
(use-package! elfeed-goodies)
(add-hook! 'elfeed-search-mode-hook 'elfeed-update)

(use-package! elfeed-org
  :config
  (setq rmh-elfeed-org-files (list "~/.shared/elfeed.org"))
  )
(setq elfeed-db-directory "~/.shared/elfeeddb")
