;; * Elfeed-org
(use-package! elfeed-org
  :defer t
  :after org
  ;; :commands (elfeed-org)
  :config
        (use-package! org)
  (setq
   rmh-elfeed-org-files '("~/dev/emacs/org/elfeed/elfeed.org")
   elfeed-db-directory "~/dev/emacs/org/elfeed/db/"
   elfeed-search-filter "@9-months-ago +unread"
   ))
(use-package!  elfeed-goodies)
