;;; conf/org-journal.el -*- lexical-binding: t; -*-

(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org"
)


(global-set-key (kbd "C-<f1>") (lambda()
			       (interactive)
			       (show-all)
			       (artist-mode)))
(use-package! org-roam
  :config(
          setq
                org-roam-directory "~/.shared/shared/emacs/org/roam-notes"

          ))
