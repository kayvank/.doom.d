;;; conf/org-journal.el -*- lexical-binding: t; -*-
;;;
(use-package! org
  :config (setq org-agenda-files "~/dev/emacs/org/tasks/iohk.org" org-todo-keywords '((sequence "TODO(t)"
                                                                              "PROG(p)" "DONE(d)"))
                org-agenda-custom-commands '(("n" "My Weekly Agenda" ((agenda "" nil)
                                                                      (todo "PROG" nil)
                                                                      (todo "TODO" nil)
                                                                      (todo "REVW" nil)
                                                                      (todo "BLOCK" nil)
                                                                      (todo "DONE" nil)) nil))
                org-todo-keyword-faces '(
                                         ("PROG" . (:foreground "yellow" :weight bold))
                                         ("BLOCK" . (:foreground "red" :weight bold))
                                         ("DONE" . (:foreground "gray"))
                                         )
                )

  (use-package! org-capture
    :init (use-package! org
            :config (setq org-clock-sound "~/dev/emacs/org/sound-files/tos-photon-torpedo-1.wav"))
    (use-package! org-roam
      :config (setq org-roam-directory "~/dev/org/roam/notes" org-roam-db-location
                    "~/dev/org/roam/notes/org-roam.db" org-roam-dailies-directory
                    "~/dev/org/roam/journal" org-persist-directory "~/dev/org/persist" org-directory
                    "~/dev/org" org-element-use-cache nil org-journal-enable-cache nil diary-file
                    "~/dev/org/roam/journal")
      :init (use-package! org-roam-ui
              :init (use-package! websocket)
              :config (setq org-roam-ui-sync-theme t org-roam-ui-follow t org-roam-ui-update-on-save
                            t org-roam-ui-open-on-start t)))
    :config (org-roam-db-autosync-mode)
    :bind (("C-c n d" . org-roam-dailies-map))))
