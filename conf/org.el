;;; conf/org-journal.el -*- lexical-binding: t; -*-
;;;
;; (setq debug-on-error t)
(defun org-config-fill-prefix ()
  "Set `fill-prefix' to the empty string."
  (setq fill-prefix ""))

(add-hook 'org-mode-hook #'org-config-fill-prefix)

(use-package! org-roam
  :init
  (setq
        org-roam-v2-ack t
        org-roam-directory "~/.shared/emacs/org/org-roam-notes"
        org-roam-db-location "~/.shared/emacs/org/db/org-roam.db"
        org-roam-completion-everywhere t
        org-roam-capture-templates '(
                                     ("d" "default" plain
                                      "%?"
                                      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                      :unnarrowed t)
                                     ("l" "programming language" plain
                                        "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
                                        :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                     ("b" "book notes" plain
                                        "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
                                        :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
                                        :unnarrowed t)
                                     ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
                                      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
                                      :unnarrowed t)
                                     )
        org-roam-dailies-directory "~/.shared/emacs/org/journal/"

  )
  (defun with-first-dailies-capture-template (dailies-find-function &rest args)
    "Temporarily shadow org-roam-dailies-capture-templates with only
its first entry when calling DAILIES-FIND-FUNCTION to prevent
template-select menu from showing."
    (let ((org-roam-dailies-capture-templates
           (list (car org-roam-dailies-capture-templates))))
      (apply dailies-find-function args)))

  ;; ADD advice to only use first dailies template for all dailies find functions
  (advice-add #'org-roam-dailies-find-today :around #'with-first-dailies-capture-template)
  (advice-add #'org-roam-dailies-find-date :around #'with-first-dailies-capture-template)
  (advice-add #'org-roam-dailies-find-tomorrow :around #'with-first-dailies-capture-template)
  (advice-add #'org-roam-dailies-find-yesterday :around #'with-first-dailies-capture-template)

  :config
  (add-hook 'org-mode-hook #'org-config-fill-prefix)
  )

  (use-package! org-journal
  :config
  (setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
      diary-file "~/.shared/emacs/org/diary"))

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


(defun psachin/create-notes-file ()
    "Create an org file in ~/notes/."
    (interactive)
    (let ((name (read-string "Filename: ")))
      (expand-file-name (format "%s.org"
                                  name) "~/.shared/emacs/org/notes/")))

(setq org-capture-templates
     '(("n" "Notes" entry
        (file psachin/create-notes-file)
       "* TITLE%?\n %U")))
