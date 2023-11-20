;; * Elfeed-org
(use-package! elfeed-org
  :defer t
  :after org
  ;; :commands (elfeed-org)
  :config
        (use-package! org)
  (setq
   rmh-elfeed-org-files '("~/.shared/emacs/elfeed/elfeed.org")
   elfeed-db-directory "~/.shared/emacs/elfeed/db/"
   ))
(use-package!  elfeed-goodies
  :defer t)
(elfeed-goodies/setup)
