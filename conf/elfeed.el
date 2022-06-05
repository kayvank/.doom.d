;; * Elfeed-org
(use-package! elfeed-org
  :commands (elfeed-org)
  :config
  (setq rmh-elfeed-org-files '("~/.shared/elfeed/elfeed.org")))

(use-package! org-ref-elfeed
  :when (featurep! :tools reference)
  :commands (org-ref-elfeed-add))
