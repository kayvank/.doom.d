;; * Elfeed-org
(use-package! elfeed-org
  :defer t
  :after org
  ;; :commands (elfeed-org)
  :config
        (use-package! org)
  (setq
   rmh-elfeed-org-files '("~/dev/org/elfeed/elfeed.org")
   elfeed-db-directory "~/dev/org/elfeed/db/"
   ))
(use-package!  elfeed-goodies
  :defer t)
(elfeed-goodies/setup)
