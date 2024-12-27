;;; conf/org.el -*- lexical-binding: t; -*-

;;; conf/org-journal.el -*- lexical-binding: t; -*-
;;;
;;;
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!


(use-package! org
  ;; :hook (org-mode . (lambda () (corfu-mode 0 )))
  :config (setq
           corfu-mode 0
           org-agenda-files "~/dev/emacs/org/tasks/iohk.org"
           org-directory "~/dev/emacs/org/"
           org-clock-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav")

    (use-package! org-roam
      :config (setq
               ;; org-roam-directory "~/dev/emacs/org/roam/archive/plutus-apps/notes"
               ;; org-roam-db-location "~/dev/emacs/org/roam/archive/plutus-apps/notes/org-roam.db"

               org-roam-directory "~/dev/emacs/org/roam/eigen-layer/notes"
               org-roam-db-location "~/dev/emacs/org/roam/eigen-layer/notes/org-roam.db"

               org-roam-dailies-directory "~/dev/emacs/org/roam/journal"
               org-persist-directory "~/dev/emacs/org/persist"
               org-directory "~/dev/emacs/org"
               org-element-use-cache nil
               org-journal-enable-cache nil
               diary-file "~/dev/emacs/org/roam/journal"
               )
      :init (use-package! org-roam-ui
              :init (use-package! websocket)
              :config (setq
                       org-roam-ui-sync-theme t
                       org-roam-ui-follow t
                       org-roam-ui-update-on-save t
                       org-roam-ui-open-on-start t
                       )
              )
      (use-package! org-noter)

      )

)

(use-package! org-tree-slide
  :custom (org-image-actual-width nil)

  )
