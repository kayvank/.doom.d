;;; conf/org-journal.el -*- lexical-binding: t; -*-
;;;

(use-package! org-capture
  :init
  (use-package! org-roam

  :config
  (setq
        org-roam-directory "~/dev/org/roam/notes"
        org-roam-db-location"~/dev/org/roam/notes/org-roam.db"
        org-roam-dailies-directory "~/dev/org/roam/journal"
        org-persist-directory "~/dev/org/persist"
        org-directory "~/dev/org"
        )
  :init
  (use-package! org-roam-ui
    :init
    (use-package! websocket)

    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
  )
  :config (
           org-roam-db-autosync-mode
           )

  :bind (
         ("C-c n d" . org-roam-dailies-map)
         )
)
