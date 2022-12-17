;;; conf/org-journal.el -*- lexical-binding: t; -*-
;;;

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
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

  (setq diary-file "~/.shared/shared/emacs/diary")
