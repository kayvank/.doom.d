;;; conf/org-journal.el -*- lexical-binding: t; -*-
(use-package! org-capture
  :defer t
  :init
  (use-package! org-roam
  :config
  (setq
        org-roam-directory "~/.shared/shared/emacs/org/roam"
        org-roam-db-location"~/.shared/shared/emacs/org/roam/org-roam.db"
        )
  )
  (use-package! org-journal
  :config
  (setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
  )
  )
)
  (setq diary-file "~/.shared/shared/emacs/diary")
