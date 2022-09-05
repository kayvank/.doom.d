;; * Elfeed-org
(use-package! elfeed-org
  :commands (elfeed-org)
  :config
  (setq
   rmh-elfeed-org-files '("~/.shared/shared/emacs/elfeed/elfeed.org")
   elfeed-db-directory "~/.shared/shared/emacs/elfeed/db/"
   ))

(use-package! org-ref-elfeed
  :when (featurep! :tools reference)
  :commands (org-ref-elfeed-add))
