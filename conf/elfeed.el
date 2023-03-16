;; * Elfeed-org
(use-package! elfeed-org
  :config
  (setq
   rmh-elfeed-org-files (list "~/.shared/emacs/org/elfeed/elfeed.org")
   elfeed-db-directory "~/.shared/emacs/org/db/elfeed/")

  )

(use-package!  elfeed-goodies )
